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
        
        it "api response is a json" do
          get :index
          
          uri = URI.parse("http://api.edamam.com/search?q=chicken&app_id=da2071e2&app_key=5dc2d144e030622c3525cf5f355d9dec&from=0&to=30")
          http = Net::HTTP.new(uri.host, uri.port)
          request = Net::HTTP::Post.new(uri.request_uri)
          response = http.request(request)
          
          json = JSON.parse(response.body)
          response.header['Content-Type'].should include 'application/json'
          
          json['hits'].each do |receita|
            passou = false;
            receita['recipe']['ingredients'].each do |ingrediente|
              if ingrediente['text'].include? "chicken"
                passou = true
              end
            end  
            expect(passou).to be true
          end
        end
      end
    end

end
