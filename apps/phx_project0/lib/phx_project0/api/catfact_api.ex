defmodule PhxProject0.Api.CatfactApi do


  def getCatFact() do
    url = "https://catfact.ninja/fact"
    response = HTTPoison.get!(url)
    Poison.decode(response.body)
  end
end
