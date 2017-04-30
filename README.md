# GoogleCivic

This package gives a very small [HTTPoison][0] interface for the [Google Civic Information API][1].

## Usage

~~~elixir
GoogleCivic.representatives "60601"
# same as
GoogleCivic.get "/representatives?address=60601"
~~~

Be sure to set `GOOGLE_CIVIC_API_KEY` as an environment variable or in your `config.exs`:

~~~elixir
config :google_civic,
  api_key: System.get_env("GOOGLE_CIVIC_API_KEY")
~~~

Docs can be found at [https://hexdocs.pm/google_civic](https://hexdocs.pm/google_civic).

## Installation

This package can be installed by adding `google_civic` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:google_civic, "~> 0.1.0"}]
end
```

[0]: https://hexdocs.pm/httpoison/api-reference.html
[1]: https://developers.google.com/civic-information/docs/using_api#representativeinfoquery-using-curl
