class LikesController < ApplicationController
  #before_action :authenticate_user!
  before_action :user_signed_in

  def create
    @food = Food.find(params[:food_id])
    current_user.like(@food)
    @like_counts = @food.like_users.count
    #binding.pry
  end

  def destroy
    @food = Food.find(params[:food_id])
    current_user.unlike(@food)
    @like_counts =  @food.like_users.count
  end
  
  private
  
  def user_signed_in
    unless user_signed_in?
      render 'likes/likes'
    end
  end
end
