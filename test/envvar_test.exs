defmodule EnvvarTest do
  use ExUnit.Case
  doctest Envvar

  test "tests the package" do
    # Load the .env file
    assert Envvar.load("test/.env") == :ok
    assert System.get_env("TESTVALUE") == "THISISATESTVALUE"
  end
end
