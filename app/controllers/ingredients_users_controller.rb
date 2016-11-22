class IngredientsUsersController < SessionController
  layout 'admin_lte_2'
  def edit
    @ingredient_in_ingredients = Ingredient.joins(:ingredients_users).where("user_id = ?", session[:user_id]).where("ingredient_id = ?", params[:id]).select("*").first
    session[:return_to] ||= request.referer
  end
end
