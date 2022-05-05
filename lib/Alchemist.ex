defmodule Alchemist.Application do
  use Application

  def start(_type, _args) do
    Alchemist.Supervisor.start_link
  end
end
