class ToppagesController < ApplicationController

  def index
    @food = Food.new
    @foods = Food.order('updated_at DESC').page(params[:page])
    if user_signed_in?
       @user = current_user
    end
    #binding.pry
    @foods.each do |food| 
      like_counts(food)
    end
  end
end
