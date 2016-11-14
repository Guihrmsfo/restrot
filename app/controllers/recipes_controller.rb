class RecipesController < SessionController
  require 'net/http'
  layout 'admin_lte_2'
  def index
    passo1 = "If usip 4 bricks with aluminum y skillet can also be used). Remove chickens from marinade; salt both sides. Brush grill with oil; transfer chickens to the grill, skin side up, and place bricks on top of chickens. Grill 10 to 15 minutes per side, until skin is dark brown and juices run clear when chicken is pierced. Serve garnished with lemon wedges."
    passo2 = "If using whole chickfoil (a large heavy skillet can also be used). Remove chickens from marinade; salt both sides. Brush grill with oil; transfer chickens to the grill, skin side up, and place bricks on top of chickens. Grill 10 to 15 minutes per side, until skin is dark brown and juices run clear when chicken is pierced. ."
    passo3 = " transfer chickens to the grill, skin side up, and place bricks on top of chickens. Grill 10 to 15 minutes per side, until skin is dark brown and juices run clear when chicken is pierced. Serve garnished with lemon wedges."
    preparation = [passo1, passo2, passo3, passo1]
   
    user_ingredients = Ingredient.joins(:ingredients_users).where("user_id = ?", session[:user_id]).select("*")
    recipe = {image: "http://bit.ly/2eN63V2", name: "Lasanha", ingredients: user_ingredients, calories: 1500, servings: 4, instructions: preparation}
    @recipes = [recipe, recipe, recipe, recipe, recipe, recipe]
    
    uri = URI.parse("http://api.edamam.com/search?q=chicken%20beer%20olive%20avocado&app_id=da2071e2&app_key=5dc2d144e030622c3525cf5f355d9dec")
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data({"user[name]" => "testusername", "user[email]" => "testemail@yahoo.com"})

    response = http.request(request)
    render :json => response.body
    
  end
  
  def create
  end

  def edit
  end

  def remove
  end
end
