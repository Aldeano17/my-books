class BooksController < ApplicationController
  # Return list of all books
  def index
    books = Book.all
    if params[:title] != nil
      books = books.select { |book| book[:title].include? params[:title].titleize }

    elsif params[:author] != nil
      books = books.select { |book| book[:author].include? params[:author].titleize }
    end

    render json: books
  end

  # Retrieve single book determined by id
  def show
    render json: Book.find(params[:id]), status: :ok
  end

  # Create new books
  def create
    title = book_params[:title].titleize
    author = book_params[:author].titleize
    description = book_params[:description].capitalize
    book = Book.new(title: title, author: author, description: description)


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