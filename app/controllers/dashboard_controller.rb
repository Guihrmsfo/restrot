class DashboardController < SessionController
  layout 'admin_lte_2'
  
  def dashboard
    @ingredients_count = IngredientsUser.where(:user_id => session[:user_id]).count
    @favorites_count = FavoriteRecipe.where(:user_id => session[:user_id]).count
    @ingredients = Ingredient.joins(:ingredients_users).where("user_id = ?", session[:user_id]).select("*").last(4)
    @usuario = User.find_by("id = ?", session[:user_id])
  end
  
end
