class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit_of_measure
      t.string :picture
      t.timestamps
    end
  end
end
