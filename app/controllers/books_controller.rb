class BooksController < ApplicationController

  before_action :authenticate_user!

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  def index
    @books = Book.page(params[:page]).reverse_order
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      redirect_to book_path(@new_book)
    else
     @books = Book.page(params[:page]).reverse_order
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path(@book)
  end

  private

  def book_params
      params.require(:book).permit(:title, :body, :user_image)
  end


end
