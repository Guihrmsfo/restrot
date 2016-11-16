class IngredientsController < SessionController
  layout 'admin_lte_2'
  
  def update
    @ingredients = IngredientsUser.find(params[:id])
    @ingredients.update_attribute(:quantity, params[:ingredient][:quantity])
    
    redirect_to session.delete(:return_to)
  end
  
  def create
        if params[:ingredientList]
            @userIngredient = IngredientsUser.new
            @userIngredient.ingredient_id = params[:ingredientList][:value]
            @userIngredient.quantity = params[:ingredientList][:quantity]
            @userIngredient.user_id = @user.id
            if @userIngredient.save
                flash[:success] = "Ingrediente salvo!"
            else
                @userIngredient.errors.full_messages.each do |error| 
                    flash[:alert] = error
                end
            end
        end
    redirect_to action: 'index'
  end

  def index
    @user = User.find_by id: session[:user_id]
    @ingredients = Ingredient.joins(:ingredients_users).where("user_id = ?", session[:user_id]).select("*")
    @user_id = session[:user_id]
    @ingredient = Ingredient.all
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
      flash.now[:error] = "Ingrediente nÃ£o existe"
    end
    redirect_to action: 'index'
  end
end
