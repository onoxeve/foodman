class FoodsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @food = Food.new
  end 
  
  def create
    #food_image = food_params[:image]
    #food = {}
    #if food_image != nil
    #  food[:image] = food_image.read
    #end
    
    @food = Food.new(food_params)
    
    if @food.save!
      flash[:success] = 'OKとりあえずトップページ(あとで修正)'
      redirect_to root_path
    else
      flash[:danger] = 'NGとりあえずトップページ(あとで修正)'
      redirect_to root_path
    end 
  end

  def show
    @food = Food.find(params[:id])
    #send_data @food.image, :type => 'image/png', :disposition => 'inline'
  end

  def destroy
  end

  private

  def food_params
    params.require(:food).permit(:image)   
  end

end
