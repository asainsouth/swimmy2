class ContactBook < ApplicationRecord
  belongs_to :user

  enum role: { general: '一般', admin: '管理者' }

  has_one_attached :contact_book_image

  def get_contact_book_image(width, height)
    unless contact_book_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      contact_book_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    contact_book_image.variant(resize_to_limit: [width, height]).processed
  end

  def set_the_day_implement
    self.begin_at = begin_at.change(year: year, month: month, day: day)
    self.closed_at = closed_at.change(year: year, month: month, day: day)
  end
end
