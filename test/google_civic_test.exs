defmodule GoogleCivicTest do
  use ExUnit.Case
  doctest GoogleCivic

  test "representatives" do
    case GoogleCivic.representatives "60601" do
      {:ok, %HTTPoison.Response{status_code: status, body: body}} ->
        assert status == 200
        assert is_map body
      {:error, %HTTPoison.Error{reason: reason}} ->
        assert is_bitstring reason
    end
  end
end
