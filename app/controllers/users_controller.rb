class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :likes]
  
  def show
    @user = User.find_by(name: params[:id])
    @user_foods = @user.foods.order('created_at DESC').page(params[:page])
    counts(@user)
    #binding.pry
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

  def likes
    @user = User.find_by(name: params[:id])
    @user_foods = @user.like_foods.page(params[:page])
    counts(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
