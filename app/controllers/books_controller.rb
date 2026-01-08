class BooksController < ApplicationController
  def index
    @books = Book.all 
  end

  def show
    @book = Book.find(params[:id])
  end


  def new
    @book = Book.new
  end

def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book created successfully"
      redirect_to books_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book successfully updated!"
       redirect_to book_path(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
     flash[:notice] =  "Book successfully deleted!"
     redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :rating)
  end
end