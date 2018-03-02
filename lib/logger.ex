defmodule Dgtidx.Logger do
  @moduledoc false
  ##			$activity = array('origen_class' =>  sprintf('"%s"', $class),
  ##							'sysid' => $sysid,
  ##							'mls' => sprintf('"%s"', $row['MLSNumber']),
  ##							'meta_key' =>  sprintf('"%s"', $metakey),
  ##							'meta_values' =>  sprintf('"%s"', addslashes($metadata)),
  ##							'status_change' => sprintf('"%s"', 'update'),
  ##							'create_at' => sprintf('"%s"', $row['OriginalEntryTimestamp']),
  ##							'last_update' => sprintf('"%s"', $row['MatrixModifiedDT']),
  ##							'date_process' => sprintf('"%s"', date('Y-m-d H:i:s')),
  ##						);
  ##			log_process($activity);

  def envolve do
    class = ""
    metakey = ""
    %{
      "origen_class" => "#{class}",
      "sysid" => "",
      "mls" => "",
      "meta_key" => "",
      "meta_values" => "",
      "status_change" => "",
      "create_at" => "",
      "last_update" => "",
      "date_process" => ""
    }
  end
end
