defmodule PhxProject0.BooksApiContextTest do
  use ExUnit.Case
  alias PhxProject0.BooksContext

  describe "books and orders." do

    test "returns books website status will succes" do
      response = BooksContext.get_book_website_status()

      assert is_tuple(response) && elem(response,0) == :ok
      end

    test "returns a book by id. Will succes" do
        response = BooksContext.get_book_by_identity(1)
        assert is_tuple(response) && elem(response,0) == :ok
    end

    test "returns a book by id. Will fail" do
      response = BooksContext.get_book_by_identity(-1)
      assert response == %{}
    end

  #  test "return a token that represent a client" do
  #    body = Poison.encode!(%{
  #      clientName: "Bob",
  #      clientEmail: "WBuobbbbbbwttvaH@exampleY.com"
  #    })
   #  response = BooksContext.create_client_get_token(body)
 #    assert String.length(response) > 0
   # end

    test "Get orders will succes" do
      token = Application.get_env(:phx_project0,:client_token)
      response = BooksContext.get_orders("fcd0f864e040d750647ac48a11570e988ed52773410c68a9437a8cfcbdf61903")
      {:ok, response_parsed} = response

       assert is_list(response_parsed)
    end

      #test "Post a order" do
 #   body = Poison.encode!(%{
   #       bookId: "3",
   #       clientEmail: "WBuobbbbbbwttvaH@example.com"
   #     })
   # response = BooksApi.post_book_order(body,"5c527430e8cf1292211c84fb82065df4b29c6ddca82b4c3509ea971a669710e1")
   # assert is_nil(response) == false
  # end
  end
end
