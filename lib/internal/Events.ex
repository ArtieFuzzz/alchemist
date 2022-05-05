defmodule Alchemist.Events do
  use Nostrum.Consumer

  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, message, _ws_state}) do
    unless message.author.bot do
      spawn fn ->
        Alchemist.Commands.parse_command(message)
      end
    end
  end

  def handle_event(_event)do
    :noop
  end
end
