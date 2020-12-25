class BooksController < ApplicationController

def index
 @user = User.find(current_user.id)
 @book = Book.new
 @books = Book.all
end

def show
  @book_new = Book.new
  @book = Book.find(params[:id])
  @user = User.find(current_user.id)
end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
if @book.save
  redirect_to book_path(@book.id), notice: 'Book was successfully created.'
else
  @books = Book.all
  @user = User.find(current_user.id)
  render :index
end
end

def edit
  @book = Book.find(params[:id])
if @book.user.id != current_user.id
redirect_to books_path
end
end

def update
 @book = Book.find(params[:id])
 if @book.update(book_params)
 redirect_to book_path(@book.id), notice:'Book was successfully update.'
 else
 render :edit
 end
end

def destroy
  book = Book.find(params[:id])
  if book.destroy
  redirect_to books_path, notice:'Book was successfully destroy.'
  end
end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end