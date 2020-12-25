class UsersController < ApplicationController


  def show
   @user = User.find(params[:id])
   @book = Book.new
   @books = @user.books
  end

def edit
 @user = User.find(params[:id])
 if @user.id != current_user.id
redirect_to user_path(current_user.id)
 end
end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
   redirect_to user_path(@user.id), notice: 'User info was successfully update.'
   else
   render :edit
   end
  end

  def index
   @user = User.find(current_user.id)
   @book = Book.new
   @users = User.all
  end

 private
  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
  end
end