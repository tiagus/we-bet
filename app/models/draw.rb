class Draw < ApplicationRecord
  has_many :bets

  validates :numbers, inclusion: 1..50
  validates :stars, inclusion: 1..12
  validates :draw_date, presence: true
  validates :closing_date, presence: true
end
