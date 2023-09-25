defmodule PhxProject0Web.BooksComponent do
  alias Gettext.Application
  alias PhxProject0.Api.BooksApi
  use PhxProject0Web, :live_view

  alias PhxProject0.BooksContext

  def mount(_params, _session, socket) do
    {:ok, assign(socket, books: [%{}],book: %{},orders: %{},book_take: "")}
  end

  def render(assigns) do
    ~H"""
      <button phx-click="show_book" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" >Show book</button>
     <h2><%= Map.get(assigns, :book, %{})["author"] %></h2>
     <h2><%= Map.get(assigns,:book, %{})["name"] %></h2>

    <!-- <button phx-click="show_orders">Show books</button> -->
     <h2><%= Map.get(assigns,:orders, %{})["bookId"] %></h2>


      <h1>Looping</h1>
      <table class="border-separate border-spacing-2 border border-slate-500 ...">
        <thead>
          <tr>
            <th class="border border-slate-600 ...">Id</th>
            <th class="border border-slate-600 ...">Name</th>
            <th class="border border-slate-600 ...">Available</th>
            <th class="border border-slate-600 ...">Type</th>
          </tr>
        </thead>
        <tbody>
          <%= for {book,index} <- Enum.with_index(Map.get(assigns, :books, [])) do %>
            <tr>
              <td phx-click="take_book" phx-value-index={index} class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"><%= book["id"] %></td>
              <td class="border border-slate-700 ..."><%= book["name"] %></td>
              <td class="border border-slate-700 ..."><%= book["type"] %></td>
              <td class="border border-slate-700 ..."><%= book["available"] %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
      <h2><%= @book_take %> </h2>

    """
  end
  def handle_event("show_book", _unsigned_params, socket) do
    book = BooksContext.get_book_by_identity(1)
    books_data = BooksContext.get_books()
    {:ok,data} = book
    {:ok,data_again} = data
    IO.puts("book data: #{inspect(data_again)} super bookskkks #{inspect(books_data)}")
    {:noreply, assign(socket, book: data_again,books: books_data)}

  end

 # def handle_event("show_books",_params, socket) do

 # end

  def handle_event("show_orders", _params, socket) do
    orders = BooksApi.get_orders("5c527430e8cf1292211c84fb82065df4b29c6ddca82b4c3509ea971a669710e1")
    {:ok,data} = orders
    IO.puts("orders #{inspect(data)}")
    {:noreply,assign(socket,orders: data)}
  end

  def handle_event("take_book", %{"index" => index}, socket) do

    {:noreply,assign(socket,book_take: "fisk #{index}")}
  end
end
