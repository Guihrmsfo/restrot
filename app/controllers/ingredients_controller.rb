class IngredientsController < SessionController
  layout 'admin_lte_2'
  def index
    @ingredients = Ingredient.joins(:ingredients_users).where("user_id = ?", session[:user_id]).select("*")
    @user_id = session[:user_id]
    #@ingredients = [Ingredient.find(1), Ingredient.find(2)]
  end
  
  def create
  end

  def edit
  end

  def remove
  end
end
