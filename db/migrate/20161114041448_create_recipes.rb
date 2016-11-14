class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :uri
      t.string :url

      t.timestamps
    end
  end
end
