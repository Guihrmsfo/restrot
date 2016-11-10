require 'rails_helper'

RSpec.describe IngredientsUsersController, type: :controller do

  describe "GET #edit" do
    
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(302)
    end
  end
  
end
