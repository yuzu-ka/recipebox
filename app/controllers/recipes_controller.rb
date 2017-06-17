class RecipesController < ApplicationController
  before_action :set_recipe, only: [ :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy, :edit, :update]
  before_action :recipe_params_show, only: [:show]
 
  def show
  end
 
  def new
    @recipe = current_user.recipes.build
    @recipe.ingredients.build
    @recipe.instractions.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = 'レシピを投稿しました。'
      redirect_to current_user
    else
      flash[:danger] = 'レシピの投稿に失敗しました。'
      render :new
    end
  end

  def edit
    
  end

  def update
  end

  def destroy
    @recipe.destroy
    flash[:success] = 'レシピを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(
      :title, :content, :volume, 
      ingredients_attributes: [:name, :amount, :_destroy], 
      instractions_attributes: [:content, :_destroy]
      )
  end
  
  def set_recipe
    @recipe = Recipe.find_by(params[:id])
  end
  
  def recipe_params_show
    @recipe = Recipe.find_by(id: params[:id])
  end
  
  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    unless @recipe
      redirect_to root_path
    end
  end
end
