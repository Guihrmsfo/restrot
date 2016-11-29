class CreateHistoryRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :history_recipes do |t|
      t.string :uri
      t.integer :user_id
      t.integer :times
      t.timestamps
    end
    add_foreign_key :history_recipes, :users, column: :user_id, primary_key: :id
  end
end
