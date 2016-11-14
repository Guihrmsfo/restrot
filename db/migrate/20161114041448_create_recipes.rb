class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :uri
      t.string :url
      t.string :picture
      t.string :label
      t.integer :user_id
      t.timestamps
    end
  end
end
