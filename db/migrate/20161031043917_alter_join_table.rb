class AlterJoinTable < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients_users, :id, :primary_key
  end
end
