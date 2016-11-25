require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  context "when user is logged in" do
    
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
      
      it "should send error message if ingredient doesnt exist" do
        delete :remove, params: {id: 'absent'}
        expect(flash[:error]).to eq("Ingrediente não existe")
      end
    end
    
    describe "GET #create" do
      it "should save ingredient successfully" do
        get :create, params: {ingredientList: {value: @ingredient.id, quantity: 10}}
        expect(assigns(:userIngredient).errors.full_messages.count).to be == 0
        expect(flash[:success]).to eq("Ingrediente salvo!")
      end
      it "send error messages when unable to save" do
        get :create, params: {ingredientList: {value: 'absent', quantity: 10}}
        expect(assigns(:userIngredient).errors.full_messages.count).to be > 0
        expect(flash[:alert]).to be_present
      end
      it "should redirect to index action" do
        get :create, params: {ingredientList: {value: @ingredient.id, quantity: 10}}
        expect(response).to redirect_to(controller: :ingredients, action: :index)
      end
    end
    
    describe "PUT #update" do
      it "should update the attributes" do
        put :update, params: {id: 1, ingredient: {quantity: 5}}
        expect(assigns(:ingredients)).not_to be_nil
        expect(assigns(:ingredients).quantity).to be == 5
        expect(response).to render_template(session[:return_to])
      end
    end
  end
end
