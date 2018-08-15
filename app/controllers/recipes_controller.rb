
class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(@recipe.id)
    @recipe.ingredients.build
  end

  def create
    recipe = Recipe.create(okay_params)
    redirect_to recipes_path
    # byebug
  end

  private

  def okay_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
  end

end


# {"0"=>{"name"=>"sugar", "quantity"=>"1 cup"}, "1"=>{"name"=>"vanilla", "quantity"=>"1 tablespoon"}}
