# ExAws.DMS

Partial implementation of AWS Database Migration Service API client for Elixir https://docs.aws.amazon.com/dms/latest/APIReference/Welcome.html

Unofficial service module for https://github.com/ex-aws/ex_aws

## Installation

The package can be installed by adding `ex_aws_dms` to your list of dependencies in `mix.exs`
along with `:ex_aws` and your preferred JSON codec / http client

```elixir
def deps do
  [
    {:ex_aws, "~> 2.0"},
    {:ex_aws_dms, git: "https://github.com/100Starlings/ex_aws_dms", "~> 0.1"},
    {:poison, "~> 3.1"},
    {:hackney, "~> 1.9"},
  ]
end
```
