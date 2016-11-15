require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  context "when user is logged in" do
    
    before(:each) do
      @password = '123456'
      @user = User.new(id: 1, name: "Any Name", email: "anyemaik@gmail.com", password: @password)
      @user.save
      @ingredient = Ingredient.new(id: 1, name: "Any Name", unit_of_measure: "Any unit")
      @ingredient.save
      @ingredients_users = IngredientsUser.new(id: 1, user_id: 1, ingredient_id: 1, quantity: 'Any Quantity')
      @ingredients_users.save
      session[:user_id] = 1
    end
  
    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
      
      it "ingredients are from the session user"do
        get :index
        assigns(:ingredients).each do |ingredient|
          expect(ingredient.user_id).to eq(1)
        end
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit
        expect(response).to have_http_status(:success)
      end
    end
    
    describe "DELETE #remove" do
      it "deletes an ingredient" do
        expect{delete :remove, id: @ingredients_users.id}.to change{@user.ingredients.count}.by(-1)
      end
    end
  end
end
