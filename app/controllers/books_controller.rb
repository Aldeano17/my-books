class BooksController < ApplicationController
  # Return list of all books
  def index
    render json: Book.all
  end

  # Retrieve single book determined by id
  def show
    render json: Book.find(params[:id]), status: :ok
  end

  # Create new books
  def create
    book = Book.new(book_params)

    if book.save
      render json: book, status: :created
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    book.save
    render json: book
  end

  def destroy
    Book.find(params[:id]).destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end

end
# murl --header "Content-Type: application/json" --request POST --data '{"author": "Ja", "title": "AB"}' http://localhost:3000/books