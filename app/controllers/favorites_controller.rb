class FavoritesController < SessionController
  layout 'admin_lte_2'
  def index
    @recipes = Recipe.joins(:favorite_recipes).where("user_id = ?", current_user.id).select("*")
  end
end
