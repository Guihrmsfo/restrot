class IngredientsController < ApplicationController
  layout 'admin_lte_2'
  def index
    @ingredients = [Ingredient.find(1), Ingredient.find(2)]
  end
  
  def create
  end

  def edit
  end

  def remove
  end
end
