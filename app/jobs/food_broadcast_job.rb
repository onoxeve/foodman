class FoodBroadcastJob < ApplicationJob
  queue_as :default

  def perform(food)
    ActionCable.server.broadcast "food_channel", food: render_food(food)
  end
  
  private
  
  def render_food(food)
    ApplicationController.render(
      partial: 'foods/food_cast',
      locals: { food: food, like_counts: food.like_users.count }
    )
  end
end
