class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :stirng
    add_index :users, :name, unique: true
  end
end

