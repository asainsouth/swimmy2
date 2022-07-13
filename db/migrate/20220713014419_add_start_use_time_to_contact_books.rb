class AddStartUseTimeToContactBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :contact_books, :start_use_time, :datetime
    add_column :contact_books, :AddFinish_use_timeToContact_books, :string
    add_column :contact_books, :finish_use_time, :datetime
  end
end
