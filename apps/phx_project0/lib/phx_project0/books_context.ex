defmodule PhxProject0.BooksContext do

  alias PhxProject0.Api.BooksApi

  def get_book_by_identity(id) do
    response = BooksApi.get_book_by_id(id)


  end
  def create_client_get_token(body) do
   response = BooksApi.post_client_for_token(body)

     case response do
      {:ok, %{"accessToken" => token}} ->
        # Hvis "accessToken" nøglen findes i responsen, returner token som {:ok, token}
        {:ok, token}
      _ ->
        # Hvis responsen ikke indeholder "accessToken", kan du returnere en fejl, hvis det er relevant
        nil
    end
  end
  def create_a_book_order(body,auth) do
    response = BooksApi.post_book_order(body,auth)
    case response do
      {:ok, %{"orderId" => orderId}} ->
        {:ok,orderId}
      _->
      nil
    end
  end
end
