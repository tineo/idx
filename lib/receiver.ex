#alias ExAws.S3

defmodule Dgtidx.Receiver do
  @moduledoc """
  Starts the receiver from a Consumer.
  This receiver opens the connection to RabbitMQ and checks that the received data is already in Redis.
  """

  @doc """
  Using `map_rds` to get all elements from a table and save these rows in Redis
  using `rds` to avoid query again to database.
  """
  def load_to_redis(map_rds) do
    # REVIEW

    ###
    # Preload
    ###

    ### Cities
    #IO.puts "Preload"
    query = "select name, id from idx_city"
    _preload_in_cache(query,map_rds.city)

    #### Offices
    query = "select code, id from idx_office"
    _preload_in_cache(query,map_rds.office)

    #### Agents and Coagents
    query = "select code, id from idx_agent"
    _preload_in_cache(query,map_rds.agent)

    #### County
    query = "select name, id from idx_county"
    _preload_in_cache(query,map_rds.county)
  end

  def _preload_in_cache(query, rds) do
    res = Ecto.Adapters.SQL.query!(Dgtidx.Repo, query, [])
    #res |> IO.inspect
    #IO.puts("nums: #{res.num_rows}")
    for c <-res.rows do
      #IO.inspect c
      {_, exists_key} = Redix.command(rds, ["EXISTS", List.first(c) ])
      if(exists_key == 0) do
        Redix.command(rds, ["SET", List.first(c) , List.last(c) ])
      end
    end
  end

  @doc """
  Check if there is `payload` in Redis if it does not exist, send it to Parser process it.
  """
  def verify_payload(payload, map_rds) do

    rds = Map.get(map_rds, :properties)
    #IO.puts "received a message!"
    row = Poison.decode!(payload)

    {_, exists_key} = Redix.command(rds, ["EXISTS", row["Matrix_Unique_ID"]])
    cur_hash = :crypto.hash(:md5, payload) |> Base.encode16()
    (if ( exists_key == 0 ) do
       IO.puts("*****New!*****")
       Redix.command(rds, ["SET", row["Matrix_Unique_ID"], cur_hash])
       Dgtidx.Parser.parse(row, map_rds)
     else
       #cur_hash = :crypto.hash(:md5, payload) |> Base.encode16()
       {_, saved_hash} = Redix.command(rds, ["GET", row["Matrix_Unique_ID"]])
       (if ( cur_hash  != saved_hash) do
          IO.puts("*****Updated!*****")
          Redix.command(rds, ["SET", row["Matrix_Unique_ID"], cur_hash])
          Dgtidx.Parser.parse(row, map_rds)
        end)
     end)
  end

  @doc """
  Get channels and Redis connection for recieve new payloads
  """
  def wait_for_messages do
    map_rds = Dgtidx.RedisMap.get_redis_map()
    load_to_redis(map_rds)
    #Agent.start_link(fn -> [] end, name: :batcher)
    Enum.each(Dgtidx.RabbitMap.get_amqp_channels(), fn(channel) -> _wait_for_messages(channel, map_rds) end)
  end

  defp _wait_for_messages(channel, map_rds) do
    receive do
      {:basic_deliver, payload, meta} ->
        verify_payload(payload, map_rds)

        IO.puts("Memory:")
        IO.inspect(:erlang.memory[:total]/1048576)

        ## ACK if no errors
        AMQP.Basic.ack(channel, meta.delivery_tag) #|> IO.inspect()
        _wait_for_messages(channel, map_rds)
    end
  end
end