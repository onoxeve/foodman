class ToppagesController < ApplicationController
  def index
    @food = Food.new
    @foods = Food.order('updated_at DESC').page(params[:page])
    if logged_in?
       @user = current_user
    end
  end
end
