class FavoritesController < SessionController
  layout 'admin_lte_2'
  def index
    @recipes ||= Array.new
    @favorites = FavoriteRecipe.where(user_id: current_user.id)
    
    if !@favorites.nil?
      
      @favorites.each do |f|
        @recipe = RecipesController.search_recipe(f.uri)
        if !@recipe.nil?
          @recipes.push(@recipe)
        end
        
      end
      
    end
  end
end
