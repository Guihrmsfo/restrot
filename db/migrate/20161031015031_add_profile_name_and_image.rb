class AddProfileNameAndImage < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_name, :string
    add_column :users, :profile_last_name, :string
    add_column :users, :profile_image, :string
  end
end
