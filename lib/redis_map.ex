defmodule Dgtidx.RedisMap do
  @moduledoc """
  
  """


  def get_redis_map() do
    {:ok, rds} = Redix.start_link("redis://127.0.0.1:6379/3", name: :redix)

    ### Redis for cache tables
    {:ok, rds_city} = Redix.start_link("redis://127.0.0.1:6379/4", name: :redix_city)
    {:ok, rds_office} = Redix.start_link("redis://127.0.0.1:6379/5", name: :redix_office)
    {:ok, rds_agent} = Redix.start_link("redis://127.0.0.1:6379/6", name: :redix_agent)
    {:ok, rds_county} = Redix.start_link("redis://127.0.0.1:6379/8", name: :redix_county)

    %{
      :properties => rds,
      :city => rds_city,
      :office => rds_office,
      :agent => rds_agent,
      :county => rds_county
    }
  end

end
