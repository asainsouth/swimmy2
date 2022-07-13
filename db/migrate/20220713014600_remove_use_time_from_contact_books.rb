class RemoveUseTimeFromContactBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :contact_books, :use_time, :datetime
  end
end
