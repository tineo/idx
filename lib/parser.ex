defmodule Dgtidx.Parser do
  @moduledoc """
  This module covert payload from RabbitMQ's queue to map.
  """

  @board_id Application.get_env(:dgtidx, :board)
  @idx_mode_debug false
  @idx_limit_rows 3500

  @idx_table_extra 'idx_property_extra'
  @idx_table_geocode 'idx_property_geocode'
  @idx_table_active 'idx_property_active'
  @idx_table_sold 'idx_property_sold'
  @idx_table_pending 'idx_property_pending'
  @idx_table_rented 'idx_property_rented'
  @idx_table_worka 'data_listings'
  @idx_table_prod 'testNewIdx'

  def dt_only_date(datetime) do
    {:ok, new_date, 0} = DateTime.from_iso8601("#{datetime.year}-#{_to_2dgts(datetime.month)}-#{_to_2dgts(datetime.day)}T00:00:00Z")
    new_date
  end
  
  def isostr_to_dt(str) do
    {:ok, datetime, _} = DateTime.from_iso8601( str )
    datetime
  end

  def str_to_valid_date(str) do
    case DateTime.from_iso8601( str<>"+05:00" ) do
      {:error, :invalid_format} -> ""
      {:ok, datetime, _} -> datetime |> datetime_to_str
    end
  end

  def str_to_datetime(str) do
    case DateTime.from_iso8601( str<>"+05:00" ) do
      {:error, _} -> ""
      {:ok, datetime, _} -> datetime
    end
  end

  def _to_2dgts(number) do
    if (number < 10) do
      "0" <> "#{number}"
    else
      "#{number}"
    end
  end

  def datetime_to_str(date) do
    da = Enum.join [date.year, _to_2dgts(date.month), _to_2dgts(date.day)], "-"
    tm = Enum.join [_to_2dgts(date.hour), _to_2dgts(date.minute), _to_2dgts(date.minute)], ":"
    dt = Enum.join [da, tm], " "
  end

  defp reverse_put(value, map, key) do
    Map.put(map,key, value)
  end

  def check_exists_in_redis(rds, data) do
    {_, exists_key} = Redix.command(rds, ["EXISTS", data.code_or_name])
    #exists_key |> IO.inspect
    if ( exists_key == 0 ) do
      IO.puts("#New! #{data.table}")
      #Maybe Redis is empty?
      query = "select #{data.field}, id from #{data.table} where #{data.field} = ? " #|> IO.puts
      {:ok, res} = Ecto.Adapters.SQL.query(Dgtidx.Repo, query, [data.code_or_name])
      if ( res.num_rows == 0) do
        #New data
        query = "insert into #{data.table} (#{data.field}) values (?)" #|> IO.puts
        #query |> IO.puts
        {:ok, res} = Ecto.Adapters.SQL.query(Dgtidx.Repo, query, [data.code_or_name]) #|> IO.inspect
        Redix.command(rds, ["SET", data.code_or_name, res.last_insert_id])
        "#{res.last_insert_id}"
      else
        #Refill Redis from database
        id = res.rows |> List.first |> List.last
        Redix.command(rds, ["SET", data.code_or_name, id])
        id
      end
    else
      {_, saved_id} = Redix.command(rds, ["GET", data.code_or_name])
      "#{saved_id}"
    end
  end

  def parse(row, map_rds) do

    idx_row = Map.new()
    rds = Map.get(map_rds, :properties)

    idx_row =
      row["Matrix_Unique_ID"] #|> IO.inspect
      |> reverse_put(idx_row, :sysid)
    idx_row =
      row["MLSNumber"] #|> IO.inspect #mls_num
      |> reverse_put(idx_row, :mls_num)
    idx_row =
      row["OriginalEntryTimestamp"]# |> IO.inspect #date_property
      |> reverse_put(idx_row, :date_property)

    #"2017-10-15T14:54:50.537"
    #row["OriginalEntryTimestamp"] #|> IO.puts
    #str = row["OriginalEntryTimestamp"] <>"+05:00"
    #str |> IO.puts
    #{:ok, datetime, _} = DateTime.from_iso8601( str )

    #str_to_valid_date(row["OriginalEntryTimestamp"]) |> IO.inspect()
    #str_to_valid_date(row["OriginalEntryTimestamp"]) |> DateTime.from_iso8601() |> IO.inspect()

    #unix = str_to_valid_date(str) |>  DateTime.to_unix() #|> IO.puts
    idx_row = (if (row["OriginalEntryTimestamp"]!="") do
                  {:ok, datetime, _} = DateTime.from_iso8601(row["OriginalEntryTimestamp"]<>"+05:00")
                  datetime |> dt_only_date() |> DateTime.to_unix()
              else
                ""
              end) |> reverse_put(idx_row, :list_date)
    #CASE PropertyType
    #    WHEN "Single Family" THEN 2
    #    WHEN "Condo/Co-Op/Villa/Townhouse" THEN 1
    #    WHEN "Residential Rental" THEN IF (	UnitNumber != "", 1, 2 )
    #    WHEN "Residential Income" THEN 27
    #    WHEN "Residential Land/Boat Docks" THEN 26
    #    WHEN "Commercial/Business/Agricultural/Industrial Land" THEN 28
    #    WHEN "Business Opportunity" THEN 29
    #    ELSE
    #        CASE
    #           WHEN (PropTypeTypeofBuilding like "%industrial%") THEN 10
    #           WHEN (PropTypeTypeofBuilding like "%medical%") THEN 12
    #           WHEN (PropTypeTypeofBuilding like "%building%") THEN 6
    #           WHEN (PropTypeTypeofBuilding like "%income%") THEN 30
    #           WHEN (PropTypeTypeofBuilding like "%hotel%") THEN 20
    #           WHEN (PropTypeTypeofBuilding like "%service%") THEN 21
    #           WHEN (PropTypeTypeofBuilding like "%restaurant%") THEN 14
    #           WHEN (PropTypeTypeofBuilding like "%warehouse%") THEN 13
    #           WHEN (PropTypeTypeofBuilding like "%retail%") THEN 15
    #           WHEN (PropTypeTypeofBuilding like "%free%") THEN 16
    #           WHEN (PropTypeTypeofBuilding like "%school%") THEN 24
    #           WHEN (PropTypeTypeofBuilding like "%office%") THEN 22
    #           WHEN (PropTypeTypeofBuilding like "%shopping%") THEN 17
    #           WHEN (PropTypeTypeofBuilding like "%store%") THEN 18
    #           WHEN (PropTypeTypeofBuilding like "%adult%") THEN 3
    #           ELSE 19
    #        END
    #END AS class_id,

    idx_row =
      (case row["PropertyType"] do
         "Single Family" -> 2
         "Condo/Co-Op/Villa/Townhouse" -> 1
         "Residential Rental" -> (if (row["UnitNumber"]!=""), do: 1, else: 2)
         "Residential Income" -> 27
         "Residential Land/Boat Docks" -> 26
         "Commercial/Business/Agricultural/Industrial Land" -> 28
         "Business Opportunity" -> 29
         _ -> (cond do
                String.contains?(row["PropTypeTypeofBuilding"], "industrial") -> 10
                String.contains?(row["PropTypeTypeofBuilding"], "medical") -> 12
                String.contains?(row["PropTypeTypeofBuilding"], "building") -> 6
                String.contains?(row["PropTypeTypeofBuilding"], "income") -> 30
                String.contains?(row["PropTypeTypeofBuilding"], "hotel") -> 20
                String.contains?(row["PropTypeTypeofBuilding"], "service") -> 21
                String.contains?(row["PropTypeTypeofBuilding"], "restaurant") -> 14
                String.contains?(row["PropTypeTypeofBuilding"], "warehouse") -> 13
                String.contains?(row["PropTypeTypeofBuilding"], "retail") -> 15
                String.contains?(row["PropTypeTypeofBuilding"], "free") -> 16
                String.contains?(row["PropTypeTypeofBuilding"], "school") -> 24
                String.contains?(row["PropTypeTypeofBuilding"], "office") -> 22
                String.contains?(row["PropTypeTypeofBuilding"], "shopping") -> 17
                String.contains?(row["PropTypeTypeofBuilding"], "store") -> 18
                String.contains?(row["PropTypeTypeofBuilding"], "adult") -> 3
                true -> 19
              end)

       end)
      |> reverse_put(idx_row, :class_id)
    #|>IO.inspect  #class_id

    #IO.puts
    idx_row =
      @board_id #board_id
      |> reverse_put(idx_row, :board_id)

    ## SELECT `id` FROM idx_city WHERE `name` = City limit 1
    datacity = %{ table: "idx_city", field: "name", code_or_name: row["City"] }
    idx_row =
      #(if (row["City"] != ""),do: row["City"], else: 0) #city_id
      (if (row["City"] != ""), do: check_exists_in_redis( map_rds.city, datacity ) , else: 0) #city_id
      |> reverse_put(idx_row, :city_id)

    ## SELECT `id` FROM idx_office WHERE `code` = ListOfficeMLSID limit 1
    #IO.puts
    dataoffice = %{ table: "idx_office", field: "code", code_or_name: row["ListOfficeMLSID"] }
    idx_row =
      (if (row["ListOfficeMLSID"]), do: check_exists_in_redis( map_rds.office, dataoffice ), else: 0) #office_id
      |> reverse_put(idx_row, :office_id)

    ## SELECT `id` FROM idx_agent WHERE `code` = ListAgentMLSID limit 1
    #IO.puts
    dataagent = %{ table: "idx_agent", field: "code", code_or_name: row["ListAgentMLSID"] }
    idx_row =
      (if (row["ListAgentMLSID"]), do: check_exists_in_redis( map_rds.agent, dataagent ), else: 0) #agent_id
      |> reverse_put(idx_row, :agent_id)

    ## SELECT `id` FROM idx_agent WHERE `code` = CoListAgentMLSID limit 1
    #IO.puts
    dataagent = %{ table: "idx_agent", field: "code", code_or_name: row["CoListAgentMLSID"] }
    idx_row =
      (if (row["CoListAgentMLSID"] != ""), do: check_exists_in_redis( map_rds.agent, dataagent ), else: 0) #co_agent_id
      |> reverse_put(idx_row, :co_agent_id)


    ## IF ( UnitNumber <> "", CONCAT_WS(" ", StreetNumber, StreetDirPrefix, StreetName, "#", UnitNumber ), CONCAT_WS(" ", StreetNumber, StreetDirPrefix, StreetName ) ) AS address_short,
    #IO.puts
    idx_row =
      (if (row["UnitNumber"] != ""),
          do: Enum.join( [row["StreetNumber"],row["StreetDirPrefix"],row["StreetName"],"#",row["UnitNumber"]], " "),
          else: Enum.join([row["StreetNumber"], row["StreetDirPrefix"], row["StreetName"]]," " )) #address_short
      |> reverse_put(idx_row, :address_short)

    #CONCAT_WS(" ", City, ", FL", PostalCode) AS address_large,
    #IO.puts
    idx_row =
      Enum.join([row["City"], ", FL",row["PostalCode"]]," ") #address_large
      |> reverse_put(idx_row, :address_large)

    #IO.puts
    idx_row =
      row["OriginalListPrice"] #price_origin
      |> reverse_put(idx_row, :price_origin)

    #IO.puts
    idx_row =
      row["ListPrice"] #price
      |> reverse_put(idx_row, :price)

    idx_row =
      (if (row["PropertyType"] in ["Single Family","Condo/Co-Op/Villa/Townhouse","Residential Rental"]),
          do: 0,else: 1) #|> IO.puts #is_commercial
      |> reverse_put(idx_row, :is_commercial)

    idx_row =
      (if (row["PropertyType"] == "Residential Rental" ),
          do: 1, else: (if (row["TypeofProperty"] == "lease"), do: 1, else: 0)) #|> IO.puts #is_rental

      |> reverse_put(idx_row, :is_rental)

    #IO.puts
    idx_row =
      row["YearBuilt"] #year
      |> reverse_put(idx_row, :year)

    #IO.puts
    idx_row =
    (if (row["BedsTotal"] != ""), do: row["BedsTotal"], else: 0) #bed
      |> reverse_put(idx_row, :bed)

    #IO.puts
    idx_row =
    (if (row["BathsFull"] != ""), do: row["BathsFull"], else: 0) #bath
      |> reverse_put(idx_row, :bath)

    #IO.puts
    idx_row =
      (if (row["BathsHalf"]!=""), do: row["BathsHalf"], else: 0 )#baths_half
      |> reverse_put(idx_row, :baths_half)

    #IO.puts
    idx_row =
      row["PhotoCount"] #img_cnt
      |> reverse_put(idx_row, :img_cnt)

    idx_row =
      (if ( row["PhotoCount"] != "" && String.to_integer(row["PhotoCount"]) > 0 ), do: Enum.join([row["MLSNumber"],"_","1.jpg"],""), else: "")
      #|> IO.puts #image
      |> reverse_put(idx_row, :image1)

    #IO.puts
    idx_row = row["PhotoModificationTimestamp"] |> reverse_put(idx_row, :img_date)#img_date


    #IO.puts
    idx_row =
      (if (row["StreetNumber"] != ""), do: row["StreetNumber"], else: "") #st_number
      |> reverse_put(idx_row, :st_number)

    #IO.puts
    idx_row =
      row["StreetName"] #st_name
      |> reverse_put(idx_row, :st_name)

    #IO.puts
    idx_row =
      row["UnitNumber"] #unit
      |> reverse_put(idx_row, :unit)

    #IO.puts
    idx_row =
      row["PostalCode"] #zip
      |> reverse_put(idx_row, :zip)

    #IO.puts
    idx_row =
      ####row["SqFtLivArea"] #sqft
     (if (row["SqFtLivArea"]!=""), do: row["SqFtLivArea"], else: 0)
      |> reverse_put(idx_row, :sqft)

    #IO.puts
    idx_row =
     (if (row["SqFtTotal"] != ""), do: row["SqFtTotal"], else: 0) #lot_size
      |> reverse_put(idx_row, :lot_size)

    #IO.puts
    idx_row =
      row["LotDescription"] #lot_desc
      |> reverse_put(idx_row, :lot_desc)

    idx_row =
      (if (row["ParkingDescription"] != ""), do: 1,else: 0)
      #|> IO.puts #parking
      |> reverse_put(idx_row, :parking)

    #IO.puts
    idx_row =
      row["ParkingDescription"] #parking_desc
      |> reverse_put(idx_row, :parking_desc)

    #IO.puts
    idx_row =
      row["LegalDescription"] #legal_desc`,
      |> reverse_put(idx_row, :legal_desc)

    ##SELECT `id` FROM idx_county WHERE `name` = CountyOrParish limit 1
    datacounty = %{ table: "idx_agent", field: "name", code_or_name: row["CoListAgentMLSID"] }
    idx_row =
      (if (row["CountyOrParish"] != "") ,do: check_exists_in_redis( map_rds.county, datacounty ),else: 0)
      #|> IO.puts #county_id
      |> reverse_put(idx_row, :county_id)

    #IO.puts
    idx_row =
      row["WaterfrontDescription"] #wv
      |> reverse_put(idx_row, :wv)

    #IO.puts
    idx_row =
      row["WaterAccess"] #wa
      |> reverse_put(idx_row, :wa)

    #IO.puts
    idx_row =
      row["Area"] #area
      |> reverse_put(idx_row, :area)

    #IO.puts
    idx_row = row["more_info"] #more_info
              |> reverse_put(idx_row, :more_info)

    #IO.puts
    idx_row = 0 #condo_unit
              |> reverse_put(idx_row, :condo_unit)

    #IO.puts
    idx_row =
      row["UnitFloorLocation"] #condo_floor
      |> reverse_put(idx_row, :condo_floor)

    #IO.puts
    idx_row =
      row["SubdivisionName"] #subdivision
      |> reverse_put(idx_row, :subdivision)

    #IO.puts
    idx_row =
      row["SubdivisionComplexBldg"] #complex
      |> reverse_put(idx_row, :complex)

    #IO.puts
    idx_row =
      row["DevelopmentName"] #development
      |> reverse_put(idx_row, :development)

    idx_row =
      (if ( String.contains?(row["Remarks"], "hotel")), do: 1, else: 0)
      # |> IO.puts #condo_hotel
      |> reverse_put(idx_row, :condo_hotel)

    #IO.puts
    idx_row =
      row["REOYN"] #foreclosure
      |> reverse_put(idx_row, :foreclosure)

    ## IF ( CONCAT_WS(' ', Remarks, WaterAccess) regexp "boat dock|private dock", 1, 0) AS `boat_dock`,
    { _, pattern } = Regex.compile("boat dock|private dock")
    idx_row =
      (if ( Regex.match?( pattern, Enum.join([row["Remarks"], " ", row["WaterAccess"]]))), do: 1, else: 0)
      # |> IO.puts #boat_dock
      |> reverse_put(idx_row, :boat_dock)

    #IO.puts
    idx_row =  0 #water_view
               |> reverse_put(idx_row, :water_view)

    #IO.puts
    idx_row =
      row["WaterfrontPropertyYN"] #water_front
      |> reverse_put(idx_row, :water_front)

    idx_row =
      (if (row["WaterfrontDescription"] == "Ocean Front"), do: 1, else: 0)
      |> reverse_put(idx_row, :ocean_front)
    #|> IO.puts #ocean_front

    ## IF (Remarks LIKE "%pool%", 1, 0) AS `pool`,
    idx_row =
      (if ( String.contains?(row["Remarks"], "pool")), do: 1, else: 0)
      #|> IO.puts #pool
      |> reverse_put(idx_row, :pool)

    idx_row =
      (if (row["FurnishedInfoList"] == "Furnished"), do: 1, else: 0)
      #|> IO.puts #furnished
      |> reverse_put(idx_row, :furnished)

    #IO.puts
    idx_row =
      (if (row["PetsAllowedYN"] != ""), do: row["PetsAllowedYN"], else: 0)#pets
      |> reverse_put(idx_row, :pets)

    idx_row =
      (if ( String.contains?(row["Remarks"], "penthouse")), do: 1, else: 0)
      |> reverse_put(idx_row, :penthouse)
    #|> IO.puts #penthouse

    idx_row =
      (if ( String.contains?(row["Remarks"], "townhouse")), do: 1, else: 0)
      |> reverse_put(idx_row, :tw)
    #|> IO.puts #tw

    idx_row =
      (if ( String.contains?(row["Remarks"], "golf")), do: 1, else: 0)
      |> reverse_put(idx_row, :golf)
    #|> IO.puts #golf

    idx_row =
      (if ( String.contains?(row["Remarks"], "tennis")), do: 1, else: 0)
      |> reverse_put(idx_row, :tennis)
    #|> IO.puts #tennis

    #IO.puts
    idx_row =
      row["ShortSaleYN"] #short_sale
      |> reverse_put(idx_row, :short_sale)

    idx_row =
      (if ( String.contains?(row["Remarks"], "house")), do: 1, else: 0)
      |> reverse_put(idx_row, :guest_house)
    #|> IO.puts #guest_house

    #IO.puts
    idx_row =
      0 #oh
      |> reverse_put(idx_row, :oh)

    idx_row =
      (if ( String.contains?(row["Remarks"], "gated")), do: 1, else: 0)
      #|> IO.puts #gated_community,
      |> reverse_put(idx_row, :gated_community)

    #IO.puts
    idx_row =
      (if (Map.has_key?(row,"UnitFloorLocation")), do: row["UnitFloorLocation"], else: 0) #unit_floor
      |> reverse_put(idx_row, :unit_floor)


    #IO.puts
    idx_row =
      (if (Map.has_key?(row,"FloorDescription")), do: row["FloorDescription"], else: "") #unit_floor
      |> reverse_put(idx_row, :floor)


    #IO.puts
    idx_row =
      row["ParcelNumber"] #folio_number
      |> reverse_put(idx_row, :folio_number)

    { _, pattern } = Regex.compile("-")
    #IF (	ParcelNumber REGEXP "-", SUBSTRING(ParcelNumber, 1, 2),	"" ) AS `fn_muni`,
    idx_row =
      ( if ( Regex.match?( pattern, row["ParcelNumber"])),
          do: String.slice(row["ParcelNumber"], 0..1), else: 0) #|> IO.puts #fn_muni
      |> reverse_put(idx_row, :fn_muni)

    #IF (	ParcelNumber REGEXP "-", SUBSTRING(ParcelNumber, 4, 2),	"" ) AS `fn_area`,
    idx_row =
      ( if ( Regex.match?( pattern, row["ParcelNumber"])),
          do: String.slice(row["ParcelNumber"], 3..4), else: 0) #|> IO.puts #fn_area
      |> reverse_put(idx_row, :fn_area)

    #IF (	ParcelNumber REGEXP "-", SUBSTRING(ParcelNumber, 7, 2),	"") AS `fn_section`,
    idx_row =
      ( if ( Regex.match?( pattern, row["ParcelNumber"])),
          do: String.slice(row["ParcelNumber"], 6..7), else: 0) #|> IO.puts #fn_section
      |> reverse_put(idx_row, :fn_section)

    #IF (	ParcelNumber REGEXP "-", SUBSTRING(ParcelNumber, 10, 3), "") AS `fn_sub`,
    idx_row =
      ( if ( Regex.match?( pattern, row["ParcelNumber"])),
          do: String.slice(row["ParcelNumber"], 9..12), else: 0) #|> IO.puts #fn_sub
      |> reverse_put(idx_row, :fn_sub)

    #CASE PropertyType
    #    WHEN "Single Family" THEN Style
    #    WHEN "Condo/Co-Op/Villa/Townhouse" THEN Style
    #    WHEN "Residential Rental" THEN Style
    #    ELSE PropTypeTypeofBuilding
    #END AS `style`,
    idx_row =
      (if ( row["PropertyType"]
            in ["Single Family", "Condo/Co-Op/Villa/Townhouse", "Residential Rental"]),
          do: row["Style"], else: row["PropTypeTypeofBuilding"]) #|> IO.puts #style
      |> reverse_put(idx_row, :style)

    #IO.puts
    #{:ok, dt, _} = DateTime.from_iso8601( row["OriginalEntryTimestamp"]<>"+05:00" )

    idx_row =
      str_to_valid_date(row["OriginalEntryTimestamp"])
      #|> datetime_to_str #date_create
      |> reverse_put(idx_row, :date_create)

    #IO.puts
    #{:ok, dt, _} = DateTime.from_iso8601( row["MatrixModifiedDT"]<>"+05:00" )
    idx_row =
      str_to_valid_date(row["MatrixModifiedDT"])
      #|> datetime_to_str #last_updated
      |> reverse_put(idx_row, :last_updated)

    today = DateTime.utc_now
    #IO.puts
    idx_row = today
    |> datetime_to_str()
    |> reverse_put(idx_row, :date_proccess)

    #CASE Status
    #    WHEN "Active" THEN 1
    #    WHEN "Closed Sale" THEN 2
    #    WHEN "Backup Contract-Call LA" THEN 6
    #    WHEN "Pending Sale" THEN 6
    #    WHEN "Rented" THEN 5
    #    ELSE 0
    #    END  AS `status`,
    idx_row =
      (case row["Status"] do
         "Active" -> 1
         "Closed Sale" -> 2
         "Backup Contract-Call LA" -> 6
         "Pending Sale" -> 6
         "Rented" -> 5
         _ -> 0
       end) #|> IO.puts #status
      |> reverse_put(idx_row, :status)
    #IF ( UnitNumber <> "",
    #        REPLACE ( REPLACE ( lower( CONCAT_WS( "-", StreetNumber, StreetDirPrefix, StreetName, UnitNumber,	City, "FL",	PostalCode,	MLSNumber ) ), "#", ""), " ", "-"),
    #        REPLACE ( REPLACE ( lower( CONCAT_WS( "-", StreetNumber, StreetDirPrefix, StreetName, City, "FL", PostalCode, MLSNumber ) ), "#", "" ), " ", "-" )
    #) AS slug,
    #0 AS `adom`,
    idx_row =
      ( if ( row["UnitNumber"] != "" ),
          do: Enum.join([
            row["StreetNumber"],row["StreetDirPrefix"],row["StreetName"],row["UnitNumber"],
            row["City"],"FL",row["PostalCode"],row["MLSNumber"]
          ], "-") |> String.downcase |> String.replace(",", "-") |> String.replace(" ", "-") ,
          else: Enum.join([
            row["StreetNumber"],row["StreetDirPrefix"],row["StreetName"],
            row["City"],"FL",row["PostalCode"],row["MLSNumber"]
          ], "-") |> String.downcase |> String.replace(",", "-") |> String.replace(" ", "-")) #|> IO.puts
      |> reverse_put(idx_row, :slug)
    idx_row =  0
      |> reverse_put(idx_row, :adom)

    #IO.puts
    idx_row =
      row["lat"] #lat
      |> reverse_put(idx_row, :lat)

    #IO.puts
    idx_row =
      row["lng"] #lng
      |> reverse_put(idx_row, :lng)

    #IO.puts
    idx_row =
      row["Status"] #status_name
      |> reverse_put(idx_row, :status_name)

    #IO.puts
    idx_row =
      row["DOM"] #days_market
      |> reverse_put(idx_row, :days_market)

    #IO.puts
    idx_row =
      row["TypeofProperty"] #type_property
      |> reverse_put(idx_row, :type_property)

    #IO.puts
    idx_row =
      row["ListingType"] #listing_type
      |> reverse_put(idx_row, :listing_type)

    #IO.puts
    idx_row =
      row["ConstructionType"] #construction
      |> reverse_put(idx_row, :construction)

    #IO.puts
    idx_row =
      row["AssocFeePaidPer"] #assoc_fee_paid
      |> reverse_put(idx_row, :assoc_fee_paid)

    #IO.puts
    idx_row =
      row["UnitView"] #unit_view
      |> reverse_put(idx_row, :unit_view)

    #IO.puts
    idx_row =
      row["FloorDescription"] #floor_desc
      |> reverse_put(idx_row, :floor_desc)

    #IO.puts
    idx_row =
      row["StyleofProperty"] #style
      |> reverse_put(idx_row, :style)

    #IO.puts
    idx_row =
      row["ParkingRestrictions"] #parking_restric
      |> reverse_put(idx_row, :parking_restric)

    #IO.puts
    idx_row =
      row["PetRestrictions"] #pets_restric
      |> reverse_put(idx_row, :pets_restric)

    #IO.puts
    idx_row =
      row["UnitFloorLocation"] #unit_building
      |> reverse_put(idx_row, :unit_building)

    #IO.puts
    idx_row =
      row["TotalFloorsInBuilding"] #floor_building
      |> reverse_put(idx_row, :floor_building)

    #IO.puts
    idx_row =
      row["StateOrProvince"] #state
      |> reverse_put(idx_row, :state)

    #IO.puts
    idx_row =
      row["TotalAcreage"] #acreage
      |> reverse_put(idx_row, :acreage)

    #IO.puts
    idx_row =
      row["RentPeriod"] #rent_period
      |> reverse_put(idx_row, :rent_period)

    #IO.puts
    idx_row =
      row["EquipmentAppliances"] #appliance
      |> reverse_put(idx_row, :appliance)

    #IO.puts
    idx_row =
      row["DiningDescription"] #dining
      |> reverse_put(idx_row, :dining)

    #IO.puts
    idx_row =
      row["CoolingDescription"] #cooling
      |> reverse_put(idx_row, :cooling)

    #IO.puts
    idx_row =
      row["Restrictions"] #restriction
      |> reverse_put(idx_row, :restriction)

    #IO.puts
    idx_row =
      row["SecurityInformation"] #security
      |> reverse_put(idx_row, :security)

    #IO.puts
    idx_row =
      row["TermsConsidered"] #terms
      |> reverse_put(idx_row, :terms)

    #IO.puts
    idx_row =
      row["TypeofGoverningBodies"] #governing
      |> reverse_put(idx_row, :governing)

    #IO.puts
    idx_row =
      row["WaterfrontFrontage"] #waterfront_frontage
      |> reverse_put(idx_row, :waterfront_frontage)

    #IO.puts
    idx_row =
      row["UnitNumber"] #unit_number
      |> reverse_put(idx_row, :unit_number)

    #IO.puts
    idx_row =
      row["TaxYear"] #tax_year
      |> reverse_put(idx_row, :tax_year)

    #IO.puts
    idx_row =
      row["TaxAmount"] #tax_amount
      |> reverse_put(idx_row, :tax_amount)

    #IO.puts
    idx_row =
      row["Remarks"] #remark
      |> reverse_put(idx_row, :remark)

    #IO.puts
    idx_row =
      row["ExteriorFeatures"] #feature_exterior
      |> reverse_put(idx_row, :feature_exterior)

    #IO.puts
    idx_row =
      row["InteriorFeatures"] #feature_interior
      |> reverse_put(idx_row, :feature_interior)

    #IO.puts
    idx_row =
      row["Amenities"] #amenities
      |> reverse_put(idx_row, :amenities)

    #IO.puts
    idx_row =
      row["AssociationFee"] #assoc_fee
      |> reverse_put(idx_row, :assoc_fee)

    #IO.puts
    idx_row =
      row["VirtualTour"] #virtual_tour
      |> reverse_put(idx_row, :virtual_tour)

    #IO.puts
    idx_row =
      row["Area"] #area
      |> reverse_put(idx_row, :area)


    #UPPER( CONCAT_WS(' ', StreetNumber, StreetDirPrefix, StreetName, City, 'FL', PostalCode )) AS address_map
    idx_row =
      Enum.join([
        row["StreetNumber"], row["StreetDirPrefix"],row["StreetName"],
        row["City"],"FL", row["PostalCode"]
      ], " ") |> String.upcase #|> IO.puts #address_map
      |> reverse_put(idx_row, :address_map) #|> IO.puts

    #idx_row[:address_map]|> IO.puts

    #IO.inspect(idx_row)
    #IO.inspect(idx_row[:status])

    #Fix to not exists columns
    idx_row = 0 |> reverse_put(idx_row, :office_seller_id)
    idx_row = 0 |> reverse_put(idx_row, :agent_seller_id)
    idx_row = 0 |> reverse_put(idx_row, :co_agent_seller_id)
    idx_row = 0 |> reverse_put(idx_row, :fireplace)
    idx_row = "" |> reverse_put(idx_row, :oh_info)
    idx_row = 0 |> reverse_put(idx_row, :equestrian)
    idx_row = 0 |> reverse_put(idx_row, :eq_num_barns)
    idx_row = 0 |> reverse_put(idx_row, :eq_num_stalls)

    idx_row = 0 |> reverse_put(idx_row, :rg_id)
    idx_row = 0 |> reverse_put(idx_row, :validate_image)
    idx_row = 0 |> reverse_put(idx_row, :office_seller_id)


    #Dgtidx.Repo.all(Dgtidx.IdxPropertyActive) |>IO.inspect
    #Dgtidx.Data.process(idx_row)
    idx_row
  end

end
