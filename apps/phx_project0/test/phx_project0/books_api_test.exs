defmodule PhxProject0.BooksApiTest do
  use ExUnit.Case

  alias PhxProject0.Api.BooksApi
  alias PhxProject0.BooksContext

  describe "books and orders" do
    test "returns books api status" do
      response = BooksApi.get_books_api_status()
      assert is_tuple(response) and elem(response, 0) == :ok
      end

    test "returns a book by id. Will succes" do
      response = BooksApi.get_book_by_id(1)
      assert is_tuple(response) and elem(response, 0) == :ok
      end

    test "returns a book by id. Will fail" do
        response = BooksApi.get_book_by_id(-1)
        assert response == {:ok, %{"error" => "No book with id -1"}}
      end


   #test "return a token that represent a client " do

    #  body = Poison.encode!(%{
     #   clientName: "Bob",
      #  clientEmail: "HABoubbwbbbbqtqqa@exaYmple.com"
     # })

    # response = BooksApi.post_client_for_token(body)

    # {:ok, parsed_response} = response

    # case response do
     # {:ok, %{"accessToken" => token}} ->
      #  IO.puts("token: {token}")
       # assert Map.has_key?(parsed_response,"accessToken")
      #_->
       # flunk("Expected a token. Response: {inspect(response)}")
    # end
    #end


  #  test "post a order" do
   #   body = Poison.encode!(%{
   #     bookId: "1",
   #     clientEmail: "Buobbbbbbwt@example.com"
   #   })

   #   response = BooksApi.post_book_order(body,"5c527430e8cf1292211c84fb82065df4b29c6ddca82b4c3509ea971a669710e1")

     # {:ok, parsed_response} = response

    #  case response do
   #     {:ok, %{"orderId" => orderId}} ->
    #     assert Map.has_key?(parsed_response, "orderId")
    #    _->
    #     flunk("token er forkert eller book er ikke på lager")
    #  end
   # end

    test "Get orders" do
      token = Application.get_env(:phx_project0,:client_token)
      IO.puts("token right here: #{token}")
      response = BooksApi.get_orders("fcd0f864e040d750647ac48a11570e988ed52773410c68a9437a8cfcbdf61903")
      {:ok, response_parsed} = response

       assert is_list(response_parsed)
    end

   test "Get order by id(That is a string)" do
      response = BooksApi.get_order_by_id("5c527430e8cf1292211c84fb82065df4b29c6ddca82b4c3509ea971a669710e1","X9tvIamGxnAYML5C2uzTW")
      assert is_tuple(response) and elem(response, 0) == :ok
   end

   #test "Post a order with context" do
 #   body = Poison.encode!(%{
   #       bookId: "3",
   #       clientEmail: "WBuobbbbbbwttvaH@example.com"
   #     })
   # response = BooksApi.post_book_order(body,"5c527430e8cf1292211c84fb82065df4b29c6ddca82b4c3509ea971a669710e1")
   # assert is_nil(response) == false
  # end
  end
end
