class RecipesController < SessionController
    layout 'admin_lte_2'
    def index
        preparation = "If usip 4 bricks with aluminum y skillet can also be used). Remove chickens from marinade; salt both sides. Brush grill with oil; transfer chickens to the grill, skin side up, and place bricks on top of chickens. Grill 10 to 15 minutes per side, until skin is dark brown and juices run clear when chicken is pierced. Serve garnished with lemon wedges."
        preparation2 = "If using whole chickens, use kitchen shears to cut along one side of the backbone of each chicken. Then cut along the other side to remove backbone; discard it. Open the chickens, skin side up, on a clean surface. Press down to flatten. Place in a large bowl.
Thinly slice 2 lemons. Squeeze the juice of remaining lemon and add both to bowl with chickens. Add remaining ingredients, except salt, and toss. Refrigerate, covered, 30 minutes or overnight.
Heat a grill to medium hot. Wrap 4 bricks with aluminum foil (a large heavy skillet can also be used). Remove chickens from marinade; salt both sides. Brush grill with oil; transfer chickens to the grill, skin side up, and place bricks on top of chickens. Grill 10 to 15 minutes per side, until skin is dark brown and juices run clear when chicken is pierced. Serve garnished with lemon wedges."
        preparation3 = "If using whole chickeavy skillet can also be used). Remove chickens from marinade; salt both sides. Brush grill with oil; transfer chickens to the grill, skin side up, and place bricks on top of chickens. Grill 10 to 15 minutes per side, until skin is dark brown and juices run clear when chicken is pierced. Serve garnished with lemon wedges."
       
        #coloquei uns textos grandes só pra ver como ficaria no layout
       
        user_ingredients = Ingredient.joins(:ingredients_users).where("user_id = ?", session[:user_id]).select("*")
        @recipes = [{image: "http://bit.ly/2eN63V2", name: "Lasanha", ingredients: user_ingredients, calories: 1500, servings: 4, instructions: preparation}, {image: "http://bit.ly/2eN63V2", name: "Nome da receita", ingredients: user_ingredients, calories: 1500, servings: 4, instructions: preparation2}, {image: "http://bit.ly/2eN63V2", name: "Nome da receita", ingredients: user_ingredients, calories: 1500, servings: 4, instructions: preparation3}, {image: "http://bit.ly/2eN63V2", name: "Nome da receita", ingredients: user_ingredients, calories: 1500, servings: 4, instructions: preparation2}, {image: "http://bit.ly/2eN63V2", name: "Nome da receita", ingredients: user_ingredients, calories: 1500, servings: 4, instructions: preparation3}]
    end
end
