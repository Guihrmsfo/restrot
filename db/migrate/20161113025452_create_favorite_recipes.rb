class CreateFavoriteRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_recipes do |t|
      t.string :uri
      t.integer :user_id
      t.timestamps
    end
    add_foreign_key :favorite_recipes, :users, column: :user_id, primary_key: :id
  end
end
