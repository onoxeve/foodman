class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @food = Food.find(params[:food_id])
    current_user.like(@food)
    like_counts(@food)
  end

  def destroy
    @food = Food.find(params[:food_id])
    current_user.unlike(@food)
    like_counts(@food)
  end
end
