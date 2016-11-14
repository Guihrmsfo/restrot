class AddConstraintsRecipes < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :recipes, :users
  end
end
