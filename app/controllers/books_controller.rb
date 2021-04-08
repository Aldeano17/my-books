class BooksController < ApplicationController
  # Return list of all books and filter by url params if given
  def index
    books = Book.all
    render json: books
    if params[:title] != nil
      books = books.where("title like ?", "%#{params[:title]}%".titleize)
    end

    if params[:author] != nil
      books = books.where("author like ?", "%#{params[:author]}%".titleize)
    end


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
