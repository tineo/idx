#alias ExAws.S3

defmodule Receiver do

  @num_upd 0
  @num_news 0

  def preload_in_cache(query, rds) do
    res = Ecto.Adapters.SQL.query!(Dgtidx.Repo, query, [])
    #res |> IO.inspect
    IO.puts("nums: #{res.num_rows}")
    for c <-res.rows do
      #IO.inspect c
      {_, exists_key} = Redix.command(rds, ["EXISTS", List.first(c) ])
      if(exists_key == 0) do
        Redix.command(rds, ["SET", List.first(c) , List.last(c) ])
      end
    end
  end

  def wait_for_messages do

    {:ok, rds} = Redix.start_link("redis://127.0.0.1:6379/3", name: :redix)

    ### Redis for cache tables
    {:ok, rds_city} = Redix.start_link("redis://127.0.0.1:6379/4", name: :redix_city)
    {:ok, rds_office} = Redix.start_link("redis://127.0.0.1:6379/5", name: :redix_office)
    {:ok, rds_agent} = Redix.start_link("redis://127.0.0.1:6379/6", name: :redix_agent)
    {:ok, rds_county} = Redix.start_link("redis://127.0.0.1:6379/8", name: :redix_county)

    queue_name = "to_process_w2"
    queue_name2 = "to_process_w2_fn"
    queue_name3 = "to_process_w2_fn_3"
    queue_name4 = "to_process_w2_fn_4"
    exchange_name = "ex_w2"
    {:ok, connection} = AMQP.Connection.open("amqp://tineo:tineo@104.131.75.179")

    {:ok, connection2} = AMQP.Connection.open("amqp://tineo:tineo@104.131.75.179")
    {:ok, connection3} = AMQP.Connection.open("amqp://tineo:tineo@104.131.75.179")

    {:ok, channel} = AMQP.Channel.open(connection)

    {:ok, channel2} = AMQP.Channel.open(connection2)
    {:ok, channel3} = AMQP.Channel.open(connection3)

    AMQP.Queue.declare(channel, queue_name, durable: true)
    AMQP.Exchange.direct(channel, exchange_name, durable: true)
    AMQP.Queue.bind(channel, queue_name, exchange_name)
    #AMQP.Basic.qos(channel, prefetch_count: 1)
    AMQP.Basic.consume(channel, queue_name, nil, no_ack: false)

    AMQP.Queue.declare(channel, queue_name2, durable: true)
    AMQP.Queue.bind(channel, queue_name2, exchange_name)
    AMQP.Basic.consume(channel, queue_name2, nil, no_ack: false)

    AMQP.Queue.declare(channel, queue_name3, durable: true)
    AMQP.Queue.bind(channel, queue_name3, exchange_name)
    AMQP.Basic.consume(channel, queue_name3, nil, no_ack: false)

    AMQP.Queue.declare(channel, queue_name4, durable: true)
    AMQP.Queue.bind(channel, queue_name4, exchange_name)
    AMQP.Basic.consume(channel, queue_name4, nil, no_ack: false)

    ###
    # Preload
    ###

    ### Cities
    IO.puts "Preload"
    query = "select name, id from idx_city"
    preload_in_cache(query,rds_city)

    #### Offices
    query = "select code, id from idx_office"
    preload_in_cache(query,rds_office)

    #### Agents and Coagents
    query = "select code, id from idx_agent"
    preload_in_cache(query,rds_agent)

    #### County
    query = "select name, id from idx_county"
    preload_in_cache(query,rds_county)

    map_rds = %{
      :properties => rds,
      :city => rds_city,
      :office => rds_office,
      :agent => rds_agent,
      :county => rds_county
    }

    #Agent.start_link(fn -> [] end, name: :batcher)
    _wait_for_messages(channel, map_rds)
    _wait_for_messages(channel2, map_rds)
    _wait_for_messages(channel3, map_rds)
  end

  defp _wait_for_messages(channel, map_rds) do
    receive do
      {:basic_deliver, payload, meta} ->

        rds = Map.get(map_rds, :properties)
        #IO.puts "received a message!"
        row = Poison.decode!(payload)

        {_, exists_key} = Redix.command(rds, ["EXISTS", row["Matrix_Unique_ID"]])
        cur_hash = :crypto.hash(:md5, payload) |> Base.encode16()
        (if ( exists_key == 0 ) do
           IO.puts("*****New!*****")
           Redix.command(rds, ["SET", row["Matrix_Unique_ID"], cur_hash])
           Parser.parse(row ,map_rds)
         else
           #cur_hash = :crypto.hash(:md5, payload) |> Base.encode16()
           {_, saved_hash} = Redix.command(rds, ["GET", row["Matrix_Unique_ID"]])
           (if ( cur_hash  != saved_hash) do
              IO.puts("*****Updated!*****")
              Redix.command(rds, ["SET", row["Matrix_Unique_ID"], cur_hash])
              Parser.parse(row ,map_rds)
           end)
        end)

        ## ACK if no errors
        AMQP.Basic.ack(channel, meta.delivery_tag) #|> IO.inspect()
        _wait_for_messages(channel, map_rds)
    end
  end
end