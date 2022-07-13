class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :contact_books, dependent: :destroy

  def full_name
  self.last_name + "" + self.fast_name
  end

  def full_name_kana
    self.last_name_kana + "" + self.fast_name_kana
  end
end
