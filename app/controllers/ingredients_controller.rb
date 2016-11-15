class IngredientsController < SessionController
  layout 'admin_lte_2'
  def index
    @ingredients = Ingredient.joins(:ingredients_users).where("user_id = ?", session[:user_id]).select("*")
    @user_id = session[:user_id]
    #@ingredients = [Ingredient.find(1), Ingredient.find(2)]
  end
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = "Ingrediente criado com sucesso!"
    else
    end
  end

  def edit
  end
  
  def update
    @ingredients = IngredientsUser.find(params[:id])
    @ingredients.update_attribute(:quantity, params[:ingredient][:quantity])
    
    redirect_to session.delete(:return_to)
  end

  def remove
    @ingredient_user = IngredientsUser.find_by id: params[:id]
    if @ingredient_user != nil
      @ingredient_user.destroy
      flash.now[:success] = "Ingrediente deletado com sucesso"
    else
      flash.now[:error] = "Ingrediente não existe"
    end
    redirect_to action: 'index'
  end
end
