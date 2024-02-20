teachers = [
  { teacher_name: '山田太郎', email: 'admin3@admin.com', password: 'Sw23225157' },
  { teacher_name: '山田治郎', email: 'admin1@admin.com', password: 'Sw23225157' },
  { teacher_name: '山田三郎', email: 'admin2@admin.com', password: 'Sw23225157' }
]

teachers.each do |teacher|
  teacher_data = Teacher.find_by(email: teacher[:email])
  if teacher_data.nil?
    Teacher.create(teacher_name: teacher[:teacher_name], email: teacher[:email], password: teacher[:password])
  end
end
