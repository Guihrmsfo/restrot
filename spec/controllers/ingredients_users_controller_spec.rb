require 'rails_helper'

RSpec.describe IngredientsUsersController, type: :controller do

  describe "GET #edit" do
    
    before(:each) do
          @password = '123456'
          @user = User.new(id: 1, name: "Any Name", email: "anyemaik@gmail.com", password: @password)
          @user.save
          @ingredient = Ingredient.new(id: 1, name: "Any Name", unit_of_measure: "Any unit")
          @ingredient.save
          @ingredients_users = IngredientsUser.new(id: 1, user_id: 1, ingredient_id: 1, quantity: 10)
          @ingredients_users.save
          session[:user_id] = 1
          session[:return_to] ||= root_path
        end
    
    it "returns http success" do
      get :edit, id: 1
      expect(response).to have_http_status(:success)
    end
  end
  
end
