class ContactBook < ApplicationRecord
  belongs_to :user

  def set_the_day_implement

    self.begin_at = self.begin_at.change(year: year, month: month, day: day)
    self.closed_at = self.closed_at.change(year: year, month: month, day: day)
  end
end
