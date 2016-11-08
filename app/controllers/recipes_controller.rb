class RecipesController < SessionController
    layout 'admin_lte_2'
    def index
        #crieiessas informações hard-coded só pra ver como ficaria no layout
        passo1 = "If usip 4 bricks with aluminum y skillet can also be used). Remove chickens from marinade; salt both sides. Brush grill with oil; transfer chickens to the grill, skin side up, and place bricks on top of chickens. Grill 10 to 15 minutes per side, until skin is dark brown and juices run clear when chicken is pierced. Serve garnished with lemon wedges."
        passo2 = "If using whole chickfoil (a large heavy skillet can also be used). Remove chickens from marinade; salt both sides. Brush grill with oil; transfer chickens to the grill, skin side up, and place bricks on top of chickens. Grill 10 to 15 minutes per side, until skin is dark brown and juices run clear when chicken is pierced. ."
        passo3 = " transfer chickens to the grill, skin side up, and place bricks on top of chickens. Grill 10 to 15 minutes per side, until skin is dark brown and juices run clear when chicken is pierced. Serve garnished with lemon wedges."
        preparation = [passo1, passo2, passo3, passo1]
       
        user_ingredients = Ingredient.joins(:ingredients_users).where("user_id = ?", session[:user_id]).select("*")
        recipe = {image: "http://bit.ly/2eN63V2", name: "Lasanha", ingredients: user_ingredients, calories: 1500, servings: 4, instructions: preparation}
        @recipes = [recipe, recipe, recipe, recipe, recipe, recipe]
    end
end
