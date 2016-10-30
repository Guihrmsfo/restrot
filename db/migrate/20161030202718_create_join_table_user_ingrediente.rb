class CreateJoinTableUserIngrediente < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :ingredientes do |t|
      t.integer :quantidade
    end
  end
end
