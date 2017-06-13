class ToppagesController < ApplicationController
  def index
    if logged_in?
      @recipes = Recipe.all
    end
  end
end
