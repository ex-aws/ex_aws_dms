defmodule ExAws.DMSTest do
  use ExUnit.Case, async: true
  alias ExAws.DMS

  test "#describe_replication_tasks" do
    assert %ExAws.Operation.JSON{service: :dms} = request = DMS.describe_replication_tasks()

    assert request.data == %{}

    assert request.headers == [
             {"x-amz-target", "AmazonDMSv20160101.DescribeReplicationTasks"},
             {"content-type", "application/x-amz-json-1.1"}
           ]
  end

  test "#start_replication_task" do
    assert %ExAws.Operation.JSON{service: :dms} =
             request = DMS.start_replication_task("arn", :resume_processing)

    assert request.data == %{
             "ReplicationTaskArn" => "arn",
             "StartReplicationTaskType" => "resume-processing"
           }

    assert request.headers == [
             {"x-amz-target", "AmazonDMSv20160101.StartReplicationTask"},
             {"content-type", "application/x-amz-json-1.1"}
           ]
  end

  test "#stop_replication_task" do
    assert %ExAws.Operation.JSON{service: :dms} = request = DMS.stop_replication_task("arn")

    assert request.data == %{
             "ReplicationTaskArn" => "arn"
           }

    assert request.headers == [
             {"x-amz-target", "AmazonDMSv20160101.StopReplicationTask"},
             {"content-type", "application/x-amz-json-1.1"}
           ]
  end
end
