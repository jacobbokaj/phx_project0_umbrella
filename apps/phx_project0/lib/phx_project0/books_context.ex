defmodule PhxProject0.BooksContext do

  alias PhxProject0.Api.BooksApi


  def get_book_website_status() do
    BooksApi.get_books_api_status()
  end

  def get_book_by_identity(id) do
    response = BooksApi.get_book_by_id(id)
    case response do
      {:ok, %{"id" => id}}
       -> {:ok,response}
       _->
      %{}
    end
  end

  def get_books() do
    response = BooksApi.get_books()
    {:ok,response_parsed} = response
    case is_list(response_parsed) do
      true ->
      response_parsed
      false ->
        [%{}]
    end
  end

  #id is a string
  def get_order_by_identity(id) do
    response = BooksApi.get_book_by_id(id)
    case response do
      {:ok, %{"id" => id}}
       -> {:ok,response}
       _->
      %{}
    end
  end


  def get_orders(auth) do
    response = BooksApi.get_orders(auth)
    {:ok,response_parsed} = response
    case is_list(response_parsed) do
      true ->
      response_parsed
      false ->
        [%{}]
    end
  end

  def create_a_book_order(body,auth) do
    response = BooksApi.post_book_order(body,auth)
    case response do
      {:ok, %{"orderId" => orderId}} ->
        {:ok,response}
      _->
      %{}
    end
  end

  def create_client_get_token(body) do
   response = BooksApi.post_client_for_token(body)

     case response do
      {:ok, %{"accessToken" => token}} ->
        {:ok, token}
      _ ->
        ""
    end
  end
end
