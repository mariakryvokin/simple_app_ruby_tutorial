class UsersController < ApplicationController
  @@greeting = "Welcome to the Sample App!"
  def new
    @user = User.new
    #debugger
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
       flash[:success] = @@greeting
       redirect_to @user
    else
      render 'new'
    end
  end
   private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end
