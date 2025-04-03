defmodule Envvar do
  @moduledoc """
  A simple dotenv parser that actually works for loading environment variables from a `.env` file.

  To install,
  1. Add `envvar` to your list of dependencies in `mix.exs`:

    ```
      def deps do
        [
          {:envvar, "~> 0.1.0"}
        ]
      end
    ```
  2. Add the following lines to `config/runtime.exs` and read environment variables as required

    ```
      require Envvar
      Envvar.load()
    ```

  """

  @spec load(String.t()) :: :ok
  @doc """
  Loads environment variables from a file.
  By default, it reads from ".env" file if no file path is specified.

  ## Parameters

    * `file` - Path to the environment file (default: ".env")

  ## Returns

    * Returns the result of parsing and setting environment variables if file is read successfully
    * Prints warning message if file cannot be read

  ## Examples

      iex> Envvar.load()
      # Loads vars from .env file

      iex> Envvar.load(".env")
      # Loads vars from custom.env file
  """
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
