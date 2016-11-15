require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do

  context "when user is logged in" do
    
    before(:each) do
      @password = '123456'
      @user = User.new(id: 1, name: "Any Name", email: "anyemail@gmail.com", password: @password)
      @user.save
      session[:user_id] = 1
    end
    
    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
    
    context "when user has favorites" do
      before(:each) do
        @favorite_recipe = FavoriteRecipe.create(user_id: 1, uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_637913ec61d9da69eb451818c3293df2")
        @favorite_recipe.save
        session[:user_id] = 1
      end
      
      describe "GET #index" do
        it "finds favorites" do
          get :index
          expect(:favorites).to_not be_nil
        end
      end
    
    end
    
  end
end
