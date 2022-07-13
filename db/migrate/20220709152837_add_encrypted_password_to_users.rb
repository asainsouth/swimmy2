class AddEncryptedPasswordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :AddPostal_codeToUsers, :string
    add_column :users, :postal_code, :string
    add_column :users, :AddAddressToUsers, :string
    add_column :users, :address, :string
    add_column :users, :AddPhone_numberToUsers, :string
    add_column :users, :phone_number, :string
  end
end
