defmodule EnvvarTest do
  use ExUnit.Case
  doctest Envvar

  test "tests direct load" do
    # Load the .env file
    assert Envvar.load("test/.env") == :ok
    assert System.get_env("TESTVALUE") == "THISISATESTVALUE"
  end

  test "tests auto load" do
    # Load the .env file
    assert Envvar.load() == :ok
    assert System.get_env("TESTVALUE") == "THISISATESTVALUE"
  end
end
