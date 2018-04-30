defmodule ExAws.DMSTest do
  use ExUnit.Case, async: true
  alias ExAws.DMS

  ## NOTE:
  # These tests are not intended to be operational examples, but intead mere
  # ensure that the form of the data to be sent to AWS is correct.
  #

  test "#start_replication_task" do
    assert DMS.start_replication_task("arn", :resume_processing).data ==
             %{
               "ReplicationTaskArn" => "arn",
               "StartReplicationTaskType" => "resume-processing"
             }
  end

  test "#stop_replication_task" do
    assert DMS.stop_replication_task("arn").data ==
             %{
               "ReplicationTaskArn" => "arn"
             }
  end
end
