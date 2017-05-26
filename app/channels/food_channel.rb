class FoodChannel < ApplicationCable::Channel
  def subscribed
    stream_from "food_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end