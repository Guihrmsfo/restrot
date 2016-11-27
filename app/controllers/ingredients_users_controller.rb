class IngredientsUsersController < SessionController
  layout 'admin_lte_2'
  def edit
    @ing_id = IngredientsUser.where("id = ?", params[:id]).select("ingredient_id").first
    @ingredient_in_ingredients = Ingredient.joins(:ingredients_users).where("user_id = ?", session[:user_id]).where("ingredient_id = ?", @ing_id.ingredient_id).select("*").first
    session[:return_to] ||= request.referer
  end
end
