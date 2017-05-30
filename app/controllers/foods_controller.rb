class FoodsController < ApplicationController
  before_action :authenticate_user!
  
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
    flash[:success] = 'You have successfully deleted the food.'
    redirect_back(fallback_location: root_path)
  end

  private

  def food_params
    params.require(:food).permit(:image)   
  end
end
