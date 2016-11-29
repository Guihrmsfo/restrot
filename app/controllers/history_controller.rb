require 'action_view'
class HistoryController < SessionController
  include ActionView::Helpers::DateHelper
  layout 'admin_lte_2'
  def index
    @recipes ||= Array.new
    @history = HistoryRecipe.where(user_id: current_user.id)
    
    if !@history.nil?
      
      @history.each do |f|
        @recipe = RecipesController.search_recipe(f.uri)
        if !@recipe.nil?
          @recipe[:last_saw] = time_ago_in_words f.updated_at
          @recipes.push(@recipe)
        end
        
      end
    end
  end
end
