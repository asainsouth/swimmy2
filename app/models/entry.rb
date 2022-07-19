class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :teacher
  belongs_to :room
end
