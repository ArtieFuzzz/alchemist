defmodule Alchemist.Commands do
  alias Nostrum.Api

  defp parse_message(message) do
    content = message.content

    unless !String.starts_with?(content, "!") do
      prefixLess = rm(content, "!")
      noExtraSpace = String.replace(prefixLess, ~r/\s+/u, " ")
      [cmd|arg] = String.split(noExtraSpace, ~r/\s+/, parts: 2)
      args = List.first(arg)

      case args do
        nil -> { cmd, nil }
        ag -> {cmd, List.to_tuple(String.split(ag, " "))}
      end

    else
      { nil, content }
    end
  end

  def parse_command(message) do
    case parse_message(message) do
      { nil, _content } -> nil
      { cmd, args } -> exec(cmd, message, args)
    end
  end

  defp rm(full, prefix) do
    bytes = byte_size(prefix)
    <<_::binary-size(bytes), rest::binary>> = full; rest
  end

  # Add commands down here.

  defp exec("ping", message, _args) do
    Api.create_message(message, "pong!")
  end

  defp exec(_name, _message, _args) do
  end
end
