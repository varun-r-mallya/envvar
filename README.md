# Envvar

A simple environment variable parser for Elixir that actually works unlike the intended one

## Usage
- Add
  ```
  require.Envvar
  Envvar.load()
  ```
  to `config/runtime.exs` first
- `require Envvar` to import the library
- `Envvar.load()` loads .env from the root directory automatically
- `Envvar.load("/path/to/file")` loads .env from the required location
- `System.get_env("NAME_OF_ENV_VAR")` to use the variable in your program.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `envvar` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:envvar, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/envvar>.

