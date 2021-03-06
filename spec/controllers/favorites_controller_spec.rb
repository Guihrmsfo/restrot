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
        @favorite_recipe = FavoriteRecipe.create(user_id: 1, uri: "http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2")
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
    
    describe "POST #favorite" do
      it "should save favorite successfully" do
        post :favorite, params: {uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_637913ec61d9da69eb451818c3293df2"}
        expect(assigns(:userFavorite).errors.full_messages.count).to be == 0
      end
      it "send error messages when unable to save" do
        post :favorite, params: {uri: ""}
        expect(assigns(:userFavorite).errors.full_messages.count).to be > 0
      end
    end
    
    describe "POST #unfavorite" do
      context "when the recipe exists" do
        before(:each) do
          @favorite_recipe = FavoriteRecipe.create(user_id: 1, uri: "http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2")
          @favorite_recipe.save
          session[:user_id] = 1
        end
        
        it "should remove a recipe from user's favorites recipes list" do
          post :unfavorite, params: {uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_637913ec61d9da69eb451818c3293df2"}
          expect(flash[:success]).to eq("A receita foi removida com sucesso de sua lista de favoritos!")
        end
        
        it "should redirect to action index successfully" do
          expect(response).to have_http_status(:success)
        end
      end
      
      context "when the recipe doesnt exists" do
        it "should alert the user" do
          post :unfavorite, params: {uri: "anything"}
          expect(flash[:alert]).to eq("Lista de favoritos não encontrada")
        end
      end
    end
  end
end
