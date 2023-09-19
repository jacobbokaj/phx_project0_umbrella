defmodule PhxProject0.CatfactApiTest do
  use ExUnit.Case



  describe "Get catfact" do
    test "returns a catfact" do
      response = PhxProject0.Api.CatfactApi.getCatFact()

      case response do
        {:ok, %{"fact" => catfact}} ->
          IO.puts("Catfact: #{catfact}")
          assert catfact != "sovs"

        _ ->
          IO.puts("Unexpected response: #{inspect(response)}")
          flunk("Expected a valid catfact response")
      end
    end
  end
end
