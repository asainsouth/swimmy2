class AddEncryptedPasswordToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :AddTeacher_nameToTeachers, :string
    add_column :teachers, :teacher_name, :string
  end
end
