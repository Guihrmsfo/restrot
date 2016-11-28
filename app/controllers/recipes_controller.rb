class RecipesController < SessionController
  require 'net/http'
  layout 'admin_lte_2'
  
  APP_ID = "da2071e2"
  APP_KEY = "5dc2d144e030622c3525cf5f355d9dec"
  
  def index
    ingredients = params[:ingredientes]
    @recipes = RecipesController.search_with_ingredients(ingredients)
  end
  
  def self.search(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    response = http.request(request)
    @recipes = ActiveSupport::JSON.decode(response.body)
    return @recipes
  end
  
  def self.search_recipe(uri)
    uri = URI.parse("http://api.edamam.com/search?r="+uri+"&app_id="+APP_ID+"&app_key="+APP_KEY)
    @recipes = self.search(uri)
    return @recipes.first
  end
  
  def self.search_with_ingredients(ingredients)
    @query = ""
    if ingredients
      ingredients.each do |ingredient|
        @query.concat(ingredient).concat(" ")
      end
    end
    
    uri = URI.parse("http://api.edamam.com/search?q="+@query+"&app_id="+APP_ID+"&app_key="+APP_KEY+"&from=0&to=100")
    result = self.search(uri)
    
    if result.empty?
      @recipes = []
    else
      @recipes = []
      result['hits'].each do |recipe|
        current_recipe =  self.get_recipe(recipe)
        @recipes.push(current_recipe)
      end
    end
    
    return @recipes
    
  end
  
  def self.get_recipe(recipe)
    current_ingredients = []
    ingredient_counter = 0
    recipe['recipe']['ingredients'].each do |ingredient|
      ingredient_counter += 1
      current_ingredient = {text: ingredient['text'], quantity: ingredient['quantity'], measure: ingredient['measure']}
      current_ingredients.push(current_ingredient)
    end  
        
    current_recipe = {image: recipe['recipe']['image'], name: recipe['recipe']['label'], calories: recipe['recipe']['calories'].to_i, uri: recipe['recipe']['uri'], url: recipe['recipe']['url'], ingredients_count: ingredient_counter, ingredients: current_ingredients}
    return current_recipe
  end
  
  def search
    @ingredients = Ingredient.joins(:ingredients_users).where("user_id = ?", session[:user_id]).select("*")
  end

  def edit
  end

  def remove
  end
end
