defmodule GoogleCivic do
  use HTTPoison.Base

  @moduledoc """
  Documentation for GoogleCivic API client.
  """

  @base_url "https://www.googleapis.com/civicinfo/v2"

  def process_url(url) do
    api_key = Application.fetch_env!(:google_civic, :api_key)
    @base_url <> url <> "&key=#{api_key}"
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

  @doc """
  Retrieve representatives for an address

  ## Examples

      GoogleCivic.representatives "60601"

  """
  @spec representatives(String.t) :: {:ok, HTTPoison.Response.t} | {:error, HTTPoison.Error.t}
  def representatives(address) do
    get("/representatives?address=" <> URI.encode(address))
  end

  @doc """
  Retrieve voter info for an address and election

  ## Examples

      GoogleCivic.voterInfo("60601", "2000")

  """
  @spec voterInfo(String.t, String.t) :: {:ok, HTTPoison.Response.t} | {:error, HTTPoison.Error.t}
  def voterInfo(address, election) do
    get("/voterInfo?address=" <> URI.encode(address) <> "&electionId=" <> URI.encode(election))
  end

  @doc """
  Retrieve elections

  ## Examples

      GoogleCivic.elections

  """
  @spec elections :: {:ok, HTTPoison.Response.t} | {:error, HTTPoison.Error.t}
  def elections do
    get("/elections")
  end
end
