class IngredientsUsersController < SessionController
  layout 'admin_lte_2'
  def edit
    @ingredients = Ingredient.joins(:ingredients_users).where("user_id = ?", session[:user_id]).where("ingredient_id = ?", params[:id]).select("*")
  end

  def update
  end
end
