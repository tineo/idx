defmodule Dgtidx.RedisMap do
  @moduledoc """
  
  """


  def get_redis_map() do

    config  = Application.get_env(:dgtidx, __MODULE__)

    #IO.inspect(config)
    {:ok, rds} = Redix.start_link(config[:rds], name: :redix)

    ### Redis for cache tables
    {:ok, rds_city} = Redix.start_link(config[:rds_city], name: :redix_city)
    {:ok, rds_office} = Redix.start_link(config[:rds_office], name: :redix_office)
    {:ok, rds_agent} = Redix.start_link(config[:rds_agent], name: :redix_agent)
    {:ok, rds_county} = Redix.start_link(config[:rds_county], name: :redix_county)

    %{
      :properties => rds,
      :city => rds_city,
      :office => rds_office,
      :agent => rds_agent,
      :county => rds_county
    }
  end

end
