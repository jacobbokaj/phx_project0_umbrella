defmodule PhxProject0.Api.BooksApi do


  def get_book_by_id(id) do
    url = "https://simple-books-api.glitch.me/books/#{id}"
    response = HTTPoison.get!(url)
    Poison.decode(response.body)
  end

  def get_books_api_status() do
    url = "https://simple-books-api.glitch.me/status"
    response = HTTPoison.get!(url)
    Poison.decode(response.body)
  end


  #id is a string.
  def get_order_by_id(auth,id) do
    url = "https://simple-books-api.glitch.me/orders/#{id}"

    headers = ["Authorization": "Bearer #{auth}", "Content-Type": "application/json"]
    response = HTTPoison.get!(url,headers)
    Poison.decode(response.body)
  end

  def get_books() do
    url = "https://simple-books-api.glitch.me/books/"
    response = HTTPoison.get!(url)
    Poison.decode(response.body)
  end

  def get_orders(auth) do
    url = "https://simple-books-api.glitch.me/orders/"
    headers = ["Authorization": "Bearer #{auth}", "Content-Type": "application/json"]
    response = HTTPoison.get!(url,headers)
    Poison.decode(response.body)
  end

  #json {"bookId": 1, "customerName": "John"}
    def post_client_for_token(body) do
    url = "https://simple-books-api.glitch.me/api-clients/"
    headers = [{"Content-type", "application/json"}]
    response = HTTPoison.post!(url,body,headers,[])
    #Skal bruge den her ellers  kalde den på em måde 2 gange?. Der betyder den siger klienten allerede findes
    Poison.decode(response.body)
  end

  def post_book_order(body,auth) do
    url = "https://simple-books-api.glitch.me/orders/"
    headers = ["Authorization": "Bearer #{auth}", "Content-Type": "application/json"]
    response = HTTPoison.post!(url,body,headers)
    Poison.decode(response.body)
  end
end
