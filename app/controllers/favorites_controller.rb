class FavoritesController < ApplicationController
  
  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.favorite(recipe)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    recipe = Recipe.find(params[:recipe_id])
    current_user.unfavorite(recipe)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
