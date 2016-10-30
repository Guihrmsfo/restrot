class IngredientsController < ApplicationController
  layout 'admin_lte_2'
  def index
    @user = User.find(6)
  end
  
  def create
  end

  def edit
  end

  def remove
  end
end
