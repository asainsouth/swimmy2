class Room < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :chats, dependent: :destroy
end
