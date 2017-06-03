class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :new]
  before_action :user_signed_in, only: :create
  
  def new
    @food = Food.new
  end
  
  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      # Model側でコールバック関数呼び出し
      # after_create_commit { FoodBroadcastJob.perform_later self }
    else
      flash[:danger] = 'Sorry, please try again later.'
      redirect_to root_path
    end
  end

  def show
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = 'Deleted successfully.'
    redirect_back(fallback_location: root_path)
  end

  private

  def food_params
    params.require(:food).permit(:image)   
  end

  def user_signed_in
    unless user_signed_in?
      render 'foods/upload'
    end
  end
end
