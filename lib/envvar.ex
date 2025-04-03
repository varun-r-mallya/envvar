defmodule Envvar do
  @moduledoc """
  A simple dotenv parser that actually works for loading environment variables from a .env file.
  """

  @spec load(String.t()) :: :ok
  def load(file \\ ".env") do
    file
    |> File.read()
    |> case do
      {:ok, contents} -> parse_and_set_env(contents)
      {:error, _} -> IO.puts("⚠️ Could not read #{file}")
    end
  end

  defp parse_and_set_env(contents) do
    contents
    |> String.split("\n", trim: true)
    |> Enum.each(&process_line/1)
  end

  defp process_line(line) do
    case String.split(line, "=", parts: 2) do
      [key, value] -> System.put_env(String.trim(key), String.trim(value))
      _ -> :ignore
    end
  end
end
