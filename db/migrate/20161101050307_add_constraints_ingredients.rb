class AddConstraintsIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients_users, :id, :primary_key
    add_foreign_key :ingredients_users, :users
    add_foreign_key :ingredients_users, :ingredients
  end
end
