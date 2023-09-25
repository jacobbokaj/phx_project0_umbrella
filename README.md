# PhxProject0.Umbrella With Simple book api
## Description 📜
Using an [Simple book](https://github.com/vdespa/introduction-to-postman-course/blob/main/simple-books-api.md) api's endpoints on a website visuel with buttons and input forms. This is **Localhost:4000**
## Features 🕹
### On the website 🖥
#### Done 🟢
- Show list of books in an table
- Click on an book
#### To do 🔴
- Create an client
- Order an book
- Delete an order
- Update an order
### In the project 🧪
#### Done 🟢
- Get api's status
- List of books
- Get a single book
- Post an order
- Get all orders
- Post an client
- Post an order
#### To do 🔴
- Update an order

## Setup 🎥
### Install 🛠
- [Elixir using asdf](https://thinkingelixir.com/install-elixir-using-asdf/)
- [Pheonix framework](https://hexdocs.pm/phoenix/installation.html)
- [Visuel studio code](https://code.visualstudio.com/download)
- [Postman](https://www.postman.com/downloads/)

### Inside the project when the order features are done ⚙️
Create a Client in Postman and save the acces token 🔑
```bash
https://simple-books-api.glitch.me/api-clients/
```
Set this in the "Body" or change the values 📝
```bash
{
   "clientName": "UserTest",
   "clientEmail": "UserTest@super.com"
}
```
Plan A. Set the token inside dev.exs file line 26 
```bash
config :phx_project0, client_token: "acces token here"
```

But for now Plan A doesn't work 🤔 so hardcode this inside the "books_component.ex" file
```bash
response = BooksApi.post_book_order(body,"acces token here")
```

### Start the project 🎬

Start project
```bash 
mix phx.server
```
Website endpoint
```bash
/books
```
### You are done 🥳🥳🥳🥳
