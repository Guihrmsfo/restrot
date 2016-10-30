class CreateIngredientes < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredientes do |t|
      t.string :nome
      t.string :unidade_medida
      t.string :foto

      t.timestamps
    end
  end
end
