class UsersController < ApplicationController

  before_action  :info, only: [:edit]

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "User was successfully updated."
       redirect_to user_path(@user.id)
    else
       @books = @user.books
       @book = Book.new
       render :edit
    end
  end


  private

  def info
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :user_image, :introduction)
  end
end
