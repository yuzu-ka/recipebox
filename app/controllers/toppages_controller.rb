class ToppagesController < ApplicationController
  def index
    @recipes = Recipe.all.order('created_at DESC').page(params[:page])
  end
  
  def favorite?(recipe)
    user.favorite_recipes.include?(recipe)
  end
end
