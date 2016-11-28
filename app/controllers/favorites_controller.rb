class FavoritesController < SessionController
  require 'uri'
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
  
  def favorite
    @alreadyFav = false
    @favorites = FavoriteRecipe.where(user_id: current_user.id)
    uri_encoded = URI.escape(params[:uri])
    
    #Pra cada favorito que o usuário possui, olha se algum deles já possui essa URI, para não salvar novamente
    if !@favorites.nil?
      @favorites.each do |f|
        if(f.uri == uri_encoded)
          @alreadyFav = true
        end
      end
    end
    
    #Se ele já não for fav, cria um fav
    if (@alreadyFav == false)
      create(uri_encoded)
    end
  end 
  
  def create(uri)
    @userFavorite = FavoriteRecipe.new
    @userFavorite.user_id = @user.id
    @userFavorite.uri = uri
    if @userFavorite.save
      flash[:success] = "Adicionado como favorito!"
    else
      @userFavorite.errors.full_messages.each do |error| 
        flash[:alert] = error
      end
    end
  end
  
  def unfavorite
    puts "desfavoritando"
  end
end