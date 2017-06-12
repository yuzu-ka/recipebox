class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @recipe = current_user.recipes.build
      @recipes = current_user.recipes.order('created_at DESC').page(params[:page])
    end
  end
end
