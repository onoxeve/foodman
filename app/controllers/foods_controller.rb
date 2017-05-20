class FoodsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @food = Food.new
  end
  
  def create
=begin
    # 内部DBに画像を保存する
    food_image = food_params[:image]
    food = {}
    if food_image != nil
      food[:image] = food_image.read
    end
=end

=begin
    if @food = Food.create!(food_params)
      #FoodChannel.broadcast 'food_channel', food: render_food(@food)
      FoodChannel.broadcast_to @food, foods: render_food(@food)
    end
  end
=end
  
#=begin
    @food = Food.new(food_params)
    if @food.save
      #ActionCable.server.broadcast "food_channel", food: render_food(food)
      #lash[:success] = 'OKとりあえずトップページ(あとで修正)'
      #FoodChannel.broadcast_to 'toppages/index', user: current_user
      #redirect_to root_path
    else
      flash[:danger] = 'NGとりあえずトップページ(あとで修正)'
      #redirect_to root_path
    end 
  end
#=end

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

  def render_food(food)
    render 'foods/food', food: @food
  end
end
