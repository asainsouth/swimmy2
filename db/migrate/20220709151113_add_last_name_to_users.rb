class AddLastNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :AddFirst_nameToUsers, :string
    add_column :users, :fast_name, :string
  end
end
