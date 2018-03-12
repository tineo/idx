#alias ExAws.S3
defmodule Dgtidx.Receiver do
  @moduledoc """
  Starts the receiver from a Consumer.
  This receiver opens the connection to RabbitMQ and checks that the received data is already in Redis.
  """
  @idx_table_extra "idx_property_extra"
  @idx_table_active "idx_property_active"
  @idx_table_sold "idx_property_sold"
  @idx_table_pending "idx_property_pending"
  @idx_table_rented "idx_property_rented"

  @queue_name Application.get_env(:dgtidx, :queue)
  @queue_name_full Application.get_env(:dgtidx, :queue_full)

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

  def get_columns(table) do
    queryt = "SHOW COLUMNS FROM #{table}"
    rest = Ecto.Adapters.SQL.query!(Dgtidx.Repo, queryt, []) #|> IO.inspect
    "results #{rest.num_rows}" #|> IO.puts
    exist_columns = []
    exist_columns = for f <- rest.rows do
      exist_columns ++ List.first(f)
    end
  end

  @doc """
  Check if there is `payload` in Redis if it does not exist, send it to Parser process it.
  """
  def verify_payload(payload, map_rds, columns, cache \\ true) do
    #IO.puts("cols:")
    #cache |> IO.inspect()
    rds = Map.get(map_rds, :properties)
    #IO.puts "received a message!"
    row = Poison.decode!(payload)

    (if (!cache == true) do
       IO.puts("no cache")
       row |> Dgtidx.Parser.parse(map_rds, false) |> Dgtidx.Data.process(:inserting, columns, false) |> IO.inspect()
     else
       ( {_, exists_key} = Redix.command(rds, ["EXISTS", row["Matrix_Unique_ID"]])
         cur_hash = :crypto.hash(:md5, payload) |> Base.encode16()

         if ( exists_key == 0 ) do
           IO.puts("*****New!*****")
           Redix.command(rds, ["SET", row["Matrix_Unique_ID"], cur_hash])
           row |> Dgtidx.Parser.parse(map_rds) |> Dgtidx.Data.process(:inserting, columns) |> IO.inspect()
         else
           #cur_hash = :crypto.hash(:md5, payload) |> Base.encode16()
           {_, saved_hash} = Redix.command(rds, ["GET", row["Matrix_Unique_ID"]])
           (if ( cur_hash  != saved_hash) do
              IO.puts("*****Updated!*****")
              Redix.command(rds, ["SET", row["Matrix_Unique_ID"], cur_hash])
              row |> Dgtidx.Parser.parse(map_rds) |> Dgtidx.Data.process(:updating, columns) |> IO.inspect()
            end)
         end)
    end)
    :ok
  end

  @doc """
  Get channels and Redis connection for recieve new payloads
  """
  def wait_for_messages() do

    columns = %{}
    columns = Map.put(columns, @idx_table_extra, get_columns(@idx_table_extra))
    columns = Map.put(columns, @idx_table_rented, get_columns(@idx_table_rented))
    columns = Map.put(columns, @idx_table_pending, get_columns(@idx_table_pending))
    columns = Map.put(columns, @idx_table_sold, get_columns(@idx_table_sold))
    columns = Map.put(columns, @idx_table_active, get_columns(@idx_table_active))

    map_rds = Dgtidx.RedisMap.get_redis_map()
    #load_to_redis(map_rds)
    #Agent.start_link(fn -> [] end, name: :batcher)
    Enum.each(Dgtidx.RabbitMap.get_amqp_channels(), fn(channel) -> _wait_for_messages(channel, map_rds, columns) end)
  end

  defp _wait_for_messages(channel, map_rds, columns) do
    receive do
      {:basic_deliver, payload, meta} ->

        case meta.exchange do
          @queue_name -> verify_payload(payload, map_rds, columns)
          @queue_name_full -> verify_payload(payload, map_rds, columns, false)
        end
        #verify_payload(payload, map_rds, columns)
        #meta.exchange |> IO.inspect()
        ## ACK if no errors
        AMQP.Basic.ack(channel, meta.delivery_tag) |> IO.inspect()
        _wait_for_messages(channel, map_rds, columns)
    end
  end
end