class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :ingredients do |t|
      t.integer :quantity
    end
  end
end
