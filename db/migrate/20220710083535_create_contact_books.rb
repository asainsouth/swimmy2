class CreateContactBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_books do |t|
      t.integer :user_id
      t.integer :teacher_id
      t.date :use_day
      t.datetime :use_time
      t.string :is_active
      t.string :eat
      t.string :private_active
      t.string :group_active
      t.text :connection
      t.timestamps
    end
  end
end
