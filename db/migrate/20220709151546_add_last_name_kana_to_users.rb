class AddLastNameKanaToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_name_kana, :string
    add_column :users, :AddFirst_name_kanaToUsers, :string
    add_column :users, :fast_name_kana, :string
  end
end
