class CreateFavoriteRecipes < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :recipes, table_name: :favorite_recipes do |t|
      t.timestamps
    end
    add_column :favorite_recipes, :id, :primary_key
    add_foreign_key :favorite_recipes, :users
    add_foreign_key :favorite_recipes, :recipes
  end
end
