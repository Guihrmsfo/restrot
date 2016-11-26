class HistoryController < SessionController
  layout 'admin_lte_2'
  def index
    @recipes ||= Array.new
    @history = HistoryRecipe.where(user_id: current_user.id)
    
    if !@history.nil?
      
      @history.each do |f|
        @recipe = RecipesController.search_recipe(f.uri)
        if !@recipe.nil?
          @recipes.push(@recipe)
        end
        
      end
      
    end
  end
end
