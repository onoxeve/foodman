class FoodChannel < ApplicationCable::Channel
  # コンシューマーがこのチャネルの購読側になると
  # このコードが呼び出される
  def subscribed
    stream_from "food_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # for test
  # def speak(data)
  #   ActionCable.server.broadcast(
  #     'food_channel', message: data['message']
  #   )
  # end
  
  def speak(data)
    food = Food.create!(image: data['image'])
    ActionCable.server.broadcast('food_channel', food: render_food(food))
  end

  private

  def render_food(food)
    ApplicationController.render(
      partial: 'foods/food', locals: { food: food }
    )
  end
end