defmodule ExAws.DMS do
  @moduledoc """
  AWS Database Migration Service API client for Elixir

  https://docs.aws.amazon.com/dms/latest/APIReference/Welcome.html
  """

  @namespace "AmazonDMSv20160101"

  @doc "Starts the replication task"
  @type task_type :: :start_replication | :resume_processing | :reload_target
  @spec start_replication_task(
          replication_task_arn :: binary,
          start_replication_task_type :: task_type
        ) :: ExAws.Operation.JSON.t()
  def start_replication_task(replication_task_arn, start_replication_task_type) do
    data = %{
      "ReplicationTaskArn" => replication_task_arn,
      "StartReplicationTaskType" =>
        start_replication_task_type |> Atom.to_string() |> String.replace("_", "-")
    }

    request(:start_replication_task, data)
  end

  @doc "Stops the replication task"
  @spec stop_replication_task(replication_task_arn :: binary) :: ExAws.Operation.JSON.t()
  def stop_replication_task(replication_task_arn) do
    data = %{
      "ReplicationTaskArn" => replication_task_arn
    }

    request(:stop_replication_task, data)
  end

  @doc "Returns information about replication tasks in the current region"
  @spec describe_replication_tasks() :: ExAws.Operation.JSON.t()
  def describe_replication_tasks() do
    request(:describe_replication_tasks, %{})
  end

  defp request(action, data, opts \\ %{}) do
    operation =
      action
      |> Atom.to_string()
      |> Macro.camelize()

    ExAws.Operation.JSON.new(
      :dms,
      %{
        data: data,
        headers: [
          {"x-amz-target", "#{@namespace}.#{operation}"},
          {"content-type", "application/x-amz-json-1.1"}
        ]
      }
      |> Map.merge(opts)
    )
  end
end
