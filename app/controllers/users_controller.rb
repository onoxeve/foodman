class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Welcome to Foodman!'
      redirect_to @user
    else
      flash.now[:danger] = 'Sorry, Please try again later.'
      render :new
    end
  end
end
