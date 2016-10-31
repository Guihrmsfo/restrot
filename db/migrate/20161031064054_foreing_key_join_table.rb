class ForeingKeyJoinTable < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :ingredients_users, :users
  end
end
