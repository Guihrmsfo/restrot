require 'rails_helper'

RSpec.describe HistoryController, type: :controller do
    
    context "when user is logged in" do
        
        before(:each) do
            @password = '123456'
            @user = User.new(id: 1, name: "Any Name", email: "anyemaik@gmail.com", password: @password)
            @user.save
            session[:user_id] = 1
            session[:return_to] ||= root_path
        end
        
        
    
        describe "GET #index" do
            
            it "returns http success" do
                get :index
                expect(response).to have_http_status(:success)
            end
            
            it "finds_recipe" do
                post :index
                @history = HistoryRecipe.new(id: 1, uri: "any", user_id: 1, times: 1, created_at: "20/10/2016 20:20", updated_at: "20/10/2016 20:21")
                expect(@history).to_not be_nil
            end
            
            it "doesn't find recipe" do 
                post :index
                expect(@history).to be_nil
            end
            
        end
        
    end
    
end
