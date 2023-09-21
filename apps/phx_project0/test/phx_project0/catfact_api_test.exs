defmodule PhxProject0.CatfactApiTest do
  use ExUnit.Case

  alias PhxProject0.Api.CatfactApi

  describe "Get catfact" do
    test "returns a catfact" do
      response = CatfactApi.getCatFact()
      assert is_tuple(response) and elem(response, 0) == :ok
    end
  end
end
