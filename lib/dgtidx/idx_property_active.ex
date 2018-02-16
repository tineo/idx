defmodule Dgtidx.IdxPropertyActive do
  @moduledoc false
  use Ecto.Schema


  schema "idx_property_active" do
    #field :id, :id
    @primary_key {:id, :id, autogenerate: true}
    field :sysid, :integer, default: 0
    field :mls_num, :string, default: ''
    field :date_property, :utc_datetime
    field :list_date, :integer, default: 0
    field :date_close, :integer, default: 0
    field :class_id, :integer, default: 0
    field :board_id, :integer, default: 0
    field :city_id, :integer, default: 0
    field :office_id, :integer , default: 0
    field :office_seller_id, :integer
    field :agent_id, :integer, default: 0
    field :co_agent_id, :integer
    field :agent_seller_id, :integer
    field :address_short, :string, default: ''
    field :address_large, :string, default: ''
    field :price_origin, :integer, default: 0
    field :price, :integer, default: 0
    field :price_sold, :integer, default: 0
    field :is_commercial, :integer, default: 0
    field :is_rental, :integer, default: 0
    field :year, :integer, default: 0
    field :bed, :integer, default: 0
    field :bath, :integer, default: 0
    field :baths_half, :integer, default: 0
    field :img_cnt, :integer, default: 0
    field :image, :string, default: ''
    field :img_date, :utc_datetime
    field :st_number, :integer, default: 0
    field :st_name, :string, default: ''
    field :zip, :integer, default: 0
    field :sqft, :float, default: 0
    field :lot_size, :integer, default: 0
    field :lot_desc, :string
    field :parking, :integer, default: 0
    field :parking_desc, :string
    field :legal_desc, :string, default: ''
    field :county_id, :integer, default: 0
    field :wv, :string, default: ''
    field :wa, :string, default: ''
    field :area, :integer, default: 0
    field :more_info, :string
    field :condo_unit, :integer, default: 0
    field :condo_floor, :integer, default: 0
    field :subdivision, :string, default: ''
    field :complex, :string, default: ''
    field :development, :string, default: ''
    field :condo_hotel, :integer, default: 0
    field :foreclosure, :integer, default: 0
    field :boat_dock, :integer, default: 0
    field :water_view, :integer, default: 0
    field :water_front, :integer, default: 0
    field :ocean_front, :integer, default: 0
    field :furnished, :integer, default: 0
    field :pets, :integer, default: 0
    field :pool, :integer, default: 0
    field :penthouse, :integer, default: 0
    field :fireplace, :integer
    field :tw, :integer, default: 0
    field :golf, :integer, default: 0
    field :tennis, :integer, default: 0
    field :short_sale, :integer, default: 0
    field :oh_info, :string, default: 0
    field :guest_house, :integer
    field :gated_community, :integer, default: 0
    field :unit_floor, :integer
    field :equestrian, :integer
    field :eq_num_barns, :integer
    field :eq_num_stalls, :integer
    field :floor, :string
    field :folio_number, :string, default: ''
    field :fn_muni, :integer
    field :fn_area, :integer
    field :fn_section, :integer
    field :fn_sub, :integer
    field :style, :string, default: ''
    field :date_create, :utc_datetime
    field :last_updated, :utc_datetime
    field :date_proccess, :utc_datetime
    field :status, :integer, default: 0
    field :validate_status, :integer, default: 0
    field :slug, :string, default: ''
    field :rg_id, :integer
    field :adom, :integer, default: 0
    field :available_date, :utc_datetime
    field :validate_image, :integer
    field :unit, :string
    field :status_name, :string


    #has_many :posts, Post
  end

end
