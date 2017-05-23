class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    @food = Food.find(params[:food_id])
    current_user.like(@food)
  end

  def destroy
    @food = Food.find(params[:food_id])
    current_user.unlike(@food)
  end
end
