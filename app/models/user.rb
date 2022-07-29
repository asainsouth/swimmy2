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
    find_or_create_by!(fast_name: 'st', last_name: 'gue', fast_name_kana: 'st', last_name_kana: 'gue', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.fast_name = 'st'
      user.last_name = 'gue'
      user.fast_name_kana = 'st'
      user.last_name_kana = 'gue'
    end
  end

  def full_name
    last_name + '' + fast_name
  end

  def full_name_kana
    last_name_kana + '' + fast_name_kana
  end
end
