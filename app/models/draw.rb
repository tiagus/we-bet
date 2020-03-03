class Draw < ApplicationRecord
  has_many :bets

  validates :draw_date, presence: true
  validates :closing_date, presence: true
end
