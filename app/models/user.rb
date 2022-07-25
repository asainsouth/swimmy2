class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :contact_books, dependent: :destroy
         has_many :entries, dependent: :destroy
         has_many :chats, dependent: :destroy

         has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  def self.guest
    find_or_create_by!(fast_name: 'guestuser',last_name: 'guestuser', fast_name_kana: 'guestuser' ,last_name_kana: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.fast_name = "guestuser"
      user.last_name = "guestuser"
      user.fast_name_kana = "guestuser"
      user.last_name_kana = "guestuser"
    end
  end

  def full_name
  self.last_name + "" + self.fast_name
  end

  def full_name_kana
    self.last_name_kana + "" + self.fast_name_kana
  end
end
