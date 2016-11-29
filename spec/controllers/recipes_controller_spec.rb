require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
    
    context "when user is logged in" do
        
      before(:each) do
        @password = '123456'
        @user = User.new(id: 1, name: "Any Name", email: "anyemaik@gmail.com", password: @password)
        @user.save
        @ingredient = Ingredient.new(id: 1, name: "chicken", unit_of_measure: "Any unit")
        @ingredient.save
        #@another_ingredient = Ingredient.new(id: 2, name: "Avocado", unit_of_measure: "Any unit")
       # @another_ingredient.save
        @ingredients_users = IngredientsUser.new(id: 1, user_id: 1, ingredient_id: 1, quantity: 'Any Quantity')
        @ingredients_users.save
        #@another_ingredients_users = IngredientsUser.new(id: 2, user_id: 1, ingredient_id: 2, quantity: 'Any Quantity')
        #@another_ingredients_users.save
        session[:user_id] = 1
      end
      
      describe "GET #index" do
        it "returns http success" do
          get :index
          expect(response).to have_http_status(:success)
        end
        
        it "finds recipe" do
          post :index, params: {:ingredientes => ['chicken']}
          @recipes = assigns(@recipes)
          expect(@recipes).to_not be_nil
        end
      end
    end

end
