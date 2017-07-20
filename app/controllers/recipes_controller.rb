class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]
  before_action :correct_user, only: [:destroy, :edit, :update]
  before_action :require_user_logged_in, only: [:create, :destroy]
  require 'aws-sdk'
  
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
    if @recipe.update(correct_user)
      flash[:success] = 'レシピを更新しました。'
      redirect_to @recipe
    else
      flash.now[:danger] = 'レシピを更新できませんでした。'
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = 'レシピを削除しました。'
    redirect_to root_path
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(
      :title, :content, :volume, :picture,
      ingredients_attributes: [:id, :name, :amount, :_destroy], 
      instractions_attributes: [:id, :content, :_destroy]
      )
  end
  
  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end
  
  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    unless @recipe
      redirect_to root_path
    end
  end
end
