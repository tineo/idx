defmodule Dgtidx.Data do

  @board_id 2
  @idx_mode_debug false
  @idx_limit_rows 3500

  @idx_table_extra "idx_property_extra"
  @idx_table_geocode "idx_property_geocode"
  @idx_table_active "idx_property_active"
  @idx_table_sold "idx_property_sold"
  @idx_table_pending "idx_property_pending"
  @idx_table_rented "idx_property_rented"
  @idx_table_worka "data_listings"
  @idx_table_prod "testNewIdx"

  ###
  @listing_more_info ["days_market", "type_property", "listing_type","construction", "assoc_fee_paid", "status_name",
    "unit_view",  "floor_desc",  "style",  "parking_restric", "pets_restric", "unit_building",
    "floor_building", "unit", "state", "acreage", "lot_size", "rent_period", "appliance", "dining",
    "cooling", "restriction", "security", "terms", "governing", "waterfront_frontage"];

  @listing_unset ["days_market", "type_property", "listing_type","construction", "assoc_fee_paid", "status_name",
    "unit_view",  "floor_desc",  "style",  "parking_restric", "pets_restric", "unit_building",
    "floor_building", "state", "acreage", "rent_period", "appliance", "dining",
    "cooling", "restriction", "security", "terms", "governing", "waterfront_frontage",
    "unit_number", "tax_year", "tax_amount", "remark", "feature_exterior", "feature_interior", "amenities", "assoc_fee",
    "virtual_tour", "area", "address_map",
    "lat", "lng"]


  #function validate_images($mls_num, $img_cnt) {
  # $list = array();
  # for ($i = 1; $i <= $img_cnt; $i++) {
  #  $list[] = $mls_num . '_' . $i . '.jpg';
  # }
  # $imagens = serialize($list);
  # return  $imagens;
  #}

  def validate_images(mls_num, img_cnt) do
    {inumber, _} = img_cnt
    imagens = []

    IO.puts("mls_num")
    IO.inspect(mls_num)

    imagens = Enum.map(1 .. inumber, fn(x) -> "#{mls_num}_#{x}.jpg" end)

    imagens
  end

  def in_list2(element, list) do
    list ++ element
  end

  def in_list(element, list) do
    List.insert_at(list, 0, element)
  end

  def delete_property(sysid, tables) do
    #global $db;
    #foreach($tables as $t) {
    #  $qformat = 'delete from %s where sysid = %d;';
    #  $qdelete = sprintf($qformat, $t, $sysid);
    #  echo "\n++".$qdelete;
    #  $db->query($qdelete);
    #}
    for table <-tables  do
      #table |> IO.puts
      query = "delete from #{table} where sysid = ?"
      Ecto.Adapters.SQL.query(Dgtidx.Repo, query, [sysid]) #|> IO.inspect
    end
  end

  def detect_status(row) do
    "status #{row[:status]}" |> IO.puts()
    case row[:status] do
      1 ->  @idx_table_active
      2 -> ( delete_property(row[:sysid],[@idx_table_active, @idx_table_pending])
             @idx_table_sold )
      6 -> ( delete_property(row[:sysid],[@idx_table_active])
             @idx_table_pending )
      5 -> ( delete_property(row[:sysid],[@idx_table_active, @idx_table_pending])
             @idx_table_rented )
      _ -> ( delete_property(row[:sysid],[@idx_table_active, @idx_table_pending, @idx_table_extra])
             "" )
    end
  end

  @doc """

  """
  def process(row) do

    #row[:address_map] |> IO.inspect
    table = detect_status(row)
    if (table != "") do
      sysid = row[:sysid]

      #$dataExtra = array( 'sysid' => $row['sysid'],
      #                    'type' => $row['type'],
      #                    'unit_number' => $row['unit_number'],
      #                    'tax_year' => $row['tax_year'],
      #                    'tax_amount' => $row['tax_amount'],
      #                    'remark' => $row['remark'],
      #                    'feature_exterior' => $row['feature_exterior'],
      #                    'feature_interior' => $row['feature_interior'],
      #                    'amenities' => $row['amenities'],
      #                    'assoc_fee' => $row['assoc_fee'],
      #                    'virtual_tour' => $row['virtual_tour'],
      #                    'area' => $row['area'],
      #                    'imagens' => $images,
      #                    'address_map' => $row['address_map'],
      #                    'date_update' => $row['last_updated']
      #                );
      more_info = %{}
      data_extra = %{}
      IO.puts("img_cnt")
      IO.puts(row.img_cnt)
      images = if ( row.img_cnt > 0), do: validate_images(row.mls_num, Integer.parse(row.img_cnt)), else: "";
      data_extra = data_extra
                   |> Map.put(:sysid, row.sysid)
                   |> Map.put(:type, "")
                   |> Map.put(:unit_number, row.unit_number)
                   |> Map.put(:tax_year, row.tax_year)
                   |> Map.put(:tax_amount, row.tax_amount)
                   |> Map.put(:remark, row.remark)
                   |> Map.put(:feature_exterior, row.feature_exterior)
                   |> Map.put(:feature_interior, row.feature_interior)
                   |> Map.put(:amenities, row.amenities)
                   |> Map.put(:assoc_fee, row.assoc_fee)
                   |> Map.put(:virtual_tour, row.virtual_tour)
                   |> Map.put(:area, row.area)
                   |> Map.put(:imagens, images)
                   |> Map.put(:address_map, row.address_map)
                   |> Map.put(:date_update, row.last_updated)


      for field_name <- @listing_more_info do
        value = row[String.to_atom(field_name)]
        if (value != ""), do: more_info = Map.put(more_info, String.to_atom(field_name),value)
      end

      #if(count($more_info) > 0) {
      #  $row['more_info'] =  serialize($new_information);
      #}

      for field <- @listing_unset do
        { _, row } = Map.pop(row, field)
      end


      ############################
      # DATA PROPERTY ACTIVE PENDING
      ############################
      #        $q = sprintf('select id from %s where sysid = %d',$table, $sysid);
      #        $rw = $db->row($q);
      #        if((int)$rw['id'] <= 0) {
      #            foreach($row as $field => $value) {
      #                if(empty($value)) continue;
      #                $datakeys[] = sprintf('`%s`', $field);
      #                $datavalues[] = sprintf('"%s"', addslashes($value));
      #            }
      #
      #            $_columns = implode($datakeys, ',');
      #            $_values = implode($datavalues, ',');
      #            $query = sprintf('insert %s (%s) values (%s)', $table, $_columns, $_values);
      #            $response = $db->query($query);
      #            if(!$response){
      #                echo "\n\n\n# T_PROPERTY ".$query;
      #            }
      #        } elseif($rw['id'] > 0) {
      #            $dataupdate = array();
      #            foreach($row as $field => $value) {
      #                if(empty($value)) continue;
      #                $dataupdate[] = sprintf('`%s` = "%s"', $field, addslashes($value));
      #            }
      #            $data_for_update = implode($dataupdate, ',');
      #            $query = sprintf('update %s set %s where sysid = %s', $table, $data_for_update, $sysid);
      #            if(IDX_MODE_DEBUG) {  echo "\n\n".$query;
      #            } else {
      #                $response = $db->query($query);
      #                if(!$response) { echo "\n# T_PROPERTY ".$query; }
      #            }
      #        }
      data_keys = []
      data_values = []
      IO.inspect(":sysid]")
      IO.inspect(row[:sysid])
      query = "select id from #{table} where sysid = ? "
      IO.inspect(query)
      res = Ecto.Adapters.SQL.query!(Dgtidx.Repo, query, [row[:sysid]]) #|> IO.inspect
      #"results #{res.num_rows}" |> IO.puts
      #res |> IO.inspect

      #IO.puts "queryt"

      queryt = "SHOW COLUMNS FROM  #{table} "
      rest = Ecto.Adapters.SQL.query!(Dgtidx.Repo, queryt, []) #|> IO.inspect
      "results #{rest.num_rows}" #|> IO.puts
      exist_columns = []
      exist_columns = for f <- rest.rows do
        exist_columns ++ List.first(f)
      end
      #exist_columns|> IO.inspect

      #IO.puts "act_pnd"

      if (res.num_rows <= 0) do

        k = row |> Map.keys #|> IO.inspect

        data_keys = for key <- k do
          if (Enum.member?( exist_columns,"#{Atom.to_string(key)}")), do: data_keys ++ "#{Atom.to_string(key)}" #|> IO.inspect
        end
        data_keys = Enum.reject(data_keys, &is_nil/1)

        data_values = for key <- k do
          if (Enum.member?( exist_columns,"#{Atom.to_string(key)}")), do: data_values ++ String.replace("#{row[key]}",~s(\"),~s(\\\")) #|> IO.inspect
        end
        data_values = Enum.reject(data_values, &is_nil/1)

        len = length(data_keys) #|> IO.inspect
        len = length(data_values) #|> IO.inspect

        isign = []
        isign = for i <- 1..len, do: isign ++ "?"
        signs = Enum.join(isign, ",") #|> IO.puts
        query = "insert into #{table} (#{Enum.join(data_keys, ",")}) values (#{signs}) "#|> IO.puts
        res = Ecto.Adapters.SQL.query!(Dgtidx.Repo, query, data_values)



      else
        keys_update = []
        keys_update = for {k, v} <- row  do
          if (Enum.member?( exist_columns,"#{Atom.to_string(k)}")), do: keys_update ++ ~s(#{k} = ?)
        end
        keys_update = Enum.reject(keys_update, &is_nil/1)

        #IO.puts("keys:  #{length(keys_update)}")

        data_for_update = []
        data_for_update = for {k, v} <- row  do
          if (Enum.member?( exist_columns,"#{Atom.to_string(k)}")), do:  data_for_update ++  String.replace("#{v}",~s(\"),~s(\\\"))
        end
        #data_for_update |> IO.inspect
        data_for_update = Enum.reject(data_for_update, &is_nil/1)

        #IO.puts("data_for_update:  #{length(data_for_update)}")

        #Enum.each row, fn {k, v} ->
        #IO.puts "#{k} --> #{v}"
        #  (if (k != "") do
        #     data_update = [ data_update | "#{k} = #{v}"]
        #   end)
        #end
        data_for_update = data_for_update ++ [row[:sysid]]
        #IO.puts("new_data_for_update:")
        #IO. inspect data_for_update
        #IO.puts("final data_for_update")
        #IO.inspect data_for_update
        #data_for_update = Enum.join(keys_update, ",") #|> IO.inspect
        query_u = "update #{table} set #{Enum.join(keys_update, ",")} where sysid = ?" #|> IO.inspect
        if (@idx_mode_debug), do: IO.puts(query), else: Ecto.Adapters.SQL.query!(Dgtidx.Repo, query_u, data_for_update )
        #|> IO.inspect
      end


      ##############
      # DATA GEOCODE
      ##############
      #       $q = sprintf('select id from %s where sysid = %d',IDX_TABLE_GEOCODE, $sysid);
      #       $rw = $db->row($q);
      #       if($lat > 0 && (int)$rw['id'] <= 0) {
      #           $query = sprintf('insert %s (%s) values (%s, %s, %s)', IDX_TABLE_GEOCODE, 'sysid, lat, lng', $sysid, $lat, $lng);
      #           $response = $db->query($query);
      #           if(!$response){
      #               echo "\n# T_GEO ".$query;
      #           }
      #       } elseif($rw['id'] > 0 && $lat > 0) {
      #           $query = sprintf('update %s set lat = %s, lng = %s, location = "" where sysid = %d', IDX_TABLE_GEOCODE, $lat, $lng, $sysid);
      #           if(IDX_MODE_DEBUG) { echo "\n".$query;
      #           } else {
      #               $response = $db->query($query);
      #               if(!$response){ echo "\n# T_GEO ".$query; }
      #           }
      #       }
      query = "select id from #{@idx_table_geocode} where sysid = ?"
      res = Ecto.Adapters.SQL.query!(Dgtidx.Repo, query, [row[:sysid]])
      #|> IO.inspect
      #IO.puts "geocode"
      if (res.num_rows <= 0 && Float.parse(row[:sysid]) > 0 ) do
        Ecto.Adapters.SQL.query!(
          Dgtidx.Repo,
          "insert #{@idx_table_geocode} (sysid, lat, lng) values (?, ?, ?)",
          [row[:sysid],row[:lat],row[:lng]]
        )

        #|> IO.inspect
      else

        Ecto.Adapters.SQL.query!(
          Dgtidx.Repo,
          "update #{@idx_table_geocode} set lat = ?, lng = ?, location = '' where sysid = ?",
          [row[:lat],row[:lng],row[:sysid]]
        )
        #|> IO.inspect
      end
      ##############
      # DATA EXTRA
      ##############
      #        $q = sprintf('select id from %s where sysid = %d',IDX_TABLE_EXTRA, $sysid);
      #        $rw = $db->row($q);
      #        if((int)$rw['id'] <= 0) {
      #            $datakeys = $datavalues = array();
      #            foreach($dataExtra as $field => $value) {
      #                if(empty($value)) continue;
      #                $datakeys[] = sprintf('`%s`', $field);
      #                $datavalues[] = sprintf('"%s"', addslashes($value));
      #            }
      #            $_columns = implode($datakeys, ',');
      #            $_values = implode($datavalues, ',');
      #
      #            $query = sprintf('insert %s (%s) values (%s)', IDX_TABLE_EXTRA, $_columns, $_values);
      #            $response = $db->query($query);
      #            if(!$response){
      #                echo "\n# T_EXTRA".$query;
      #            }
      #        } elseif($rw['id'] > 0) {
      #            $dataupdate = array();
      #            foreach($dataExtra as $field => $value) {
      #                if(empty($value)) continue;
      #                $dataupdate[] = sprintf('`%s` = "%s"', $field, addslashes($value));
      #            }
      #            $data_for_update = implode($dataupdate, ',');
      #            $query = sprintf('update %s set %s where sysid = %s', IDX_TABLE_EXTRA, $data_for_update, $sysid);
      #            if(IDX_MODE_DEBUG) { echo "\n".$query;
      #            } else {
      #                $response = $db->query($query);
      #                if(!$response){ echo "\n# T_EXTRA ".$query; }
      #            }
      #        }
      #    }
      #    $db->CloseConnection();
      #    sleep(2);

      query = "select id from #{@idx_table_extra} where sysid = ?"
      res = Ecto.Adapters.SQL.query!(Dgtidx.Repo, query, [row[:sysid]]) #|> IO.inspect
      #IO.puts "extra"

      query_extra = "SHOW COLUMNS FROM  #{@idx_table_extra} "
      res_extra = Ecto.Adapters.SQL.query!(Dgtidx.Repo, query_extra, []) #|> IO.inspect
      #"results _extra #{res_extra.num_rows}" #|> IO.puts
      exist_columns_extra = []
      exist_columns_extra = for f <- res_extra.rows do
        exist_columns_extra ++ List.first(f)
      end

      if (res.num_rows <= 0) do
        data_keys_extra = []
        data_values_extra = []

        k = data_extra |> Map.keys #|> IO.inspect

        data_keys_extra = for key <- k do
          if (Enum.member?( exist_columns_extra,"#{Atom.to_string(key)}")), do: data_keys_extra ++ ~s(#{key})
        end
        data_keys_extra = Enum.reject(data_keys_extra, &is_nil/1)

        data_values_extra = for key <- k do
          if (Enum.member?( exist_columns_extra,"#{Atom.to_string(key)}")), do: data_values_extra ++ String.replace("#{data_extra[key]}",~s(\"),~s(\\\")) #|> IO.inspect
        end
        data_values_extra = Enum.reject(data_values_extra, &is_nil/1)

        len = length(data_keys_extra)
        isign = []
        isign = for i <- 1..len, do: isign ++ "?"
        signs = Enum.join(isign, ",") #|> IO.puts

        query = "insert #{@idx_table_extra} (#{Enum.join(data_keys_extra, ",")}) values (#{signs})"
        res = Ecto.Adapters.SQL.query!(Dgtidx.Repo, query, data_values_extra) #|> IO.inspect

      else
        data_for_update_extra = []
        keys_update_extra = []

        k = data_extra |> Map.keys #|> IO.inspect

        keys_update_extra = for {k, v} <- data_extra  do
          if (Enum.member?( exist_columns_extra,"#{Atom.to_string(k)}")), do: keys_update_extra ++ ~s(#{k} = ?)
        end
        keys_update_extra = Enum.reject(keys_update_extra, &is_nil/1)

        data_for_update_extra = []
        data_for_update_extra = for {k, v} <- data_extra  do
          if (Enum.member?( exist_columns_extra,"#{Atom.to_string(k)}")), do:  data_for_update_extra ++  String.replace("#{v}",~s(\"),~s(\\\"))
        end
        #data_for_update_extra |> IO.inspect
        data_for_update_extra = Enum.reject(data_for_update_extra, &is_nil/1)

        #IO.puts("keys_extra:  #{length(keys_update_extra)}")

        #data_for_update_extra = Enum.join(data_for_update_extra, ",")
        query = "update #{@idx_table_extra} set #{Enum.join(keys_update_extra, ",")} where sysid = ?"
        if (@idx_mode_debug), do: IO.puts(query), else: Ecto.Adapters.SQL.query!(Dgtidx.Repo, query, data_for_update_extra ++ [row[:sysid]]) #|> IO.inspect
      end


      "UPDATE #{@idx_table_geocode} AS g
		SET location = GeomFromText ( CONCAT( 'POINT(', g.lat, ' ', g.lng, ')' ) )
		WHERE lat > 0
		AND ( location = '' OR location IS NULL )"
      #|> Ecto.Adapters.SQL.query!([])
      #|> IO.inspect
      :ok
    end

  end

end
