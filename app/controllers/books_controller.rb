class BooksController < ApplicationController

  before_action  :info, only: [:edit]

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
  end


  def new
    @book = Book.new
    @books = Book.all
    @books = @books.select{|book| book.user_id == current_user.id}
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "Book was successfully created."
       redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "Book was successfully updated."
       redirect_to book_path(@book)
    else
       render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    if book.destroy
       flash[:notice] = "Book was successfully destroyed."
       redirect_to user_path(current_user)
    end
  end

  private

  def info
    book = Book.find(params[:id])
    if book.user_id != current_user.id
       redirect_to user_path(current_user)
    end
  end


  def book_params
    params.require(:book).permit(:title, :category, :body)
  end
end
