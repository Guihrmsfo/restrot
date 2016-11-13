class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :picture
      t.string :source
      t.integer :yield
      t.timestamps
    end
  end
end
