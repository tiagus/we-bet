class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :draw

  # validates :numbers, presence: true, uniqueness: true
  # validates :numbers, inclusion: 1..50
  # validates :stars, presence: true, uniqueness: true
  # validates :stars, inclusion: 1..12
  # validates :milhao, presence: true
  # validates :number_of_weeks, presence: true, numericality: { only_integer: true }
  # validates :auto_renew, presence: true
  # validates :status, presence: true
end
