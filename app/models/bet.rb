class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :draw

  validates :numbers, presence: true
  validates :stars, presence: true
  validates :number_of_weeks, presence: true, numericality: { only_integer: true }
  validates :status, presence: true
end
