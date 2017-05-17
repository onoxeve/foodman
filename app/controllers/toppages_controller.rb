class ToppagesController < ApplicationController
  def index
    @food = Food.new
    @foods = Food.order('updated_at DESC')
  end
end
