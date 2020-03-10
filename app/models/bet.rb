class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :draw, optional: true
  monetize :price_cents
  after_initialize :set_price

  validates :numbers, presence: true
  validates :numbers, length: { is: 5 }
  validate :validate_numbers
  validate :uniq_numbers
  validates :stars, presence: true
  validates :stars, length: { is: 2 }
  validate :validate_stars
  validate :uniq_stars
  validates :number_of_weeks, presence: true, numericality: { only_integer: true }
  # validates :status, presence: true

  private

  def set_price
    self.price_cents = 250
  end

  def validate_numbers
    if !numbers.is_a?(Array) || numbers.detect{|d| !(1..50).include?(d)}
      errors.add(:numbers, 'Play a number between 1 and 50')
    end
  end
  def validate_stars
    if !stars.is_a?(Array) || stars.detect{|d| !(1..12).include?(d)}
      errors.add(:stars, 'Play a star between 1 and 12')
    end
  end

  def uniq_numbers
    unless self.numbers.uniq == self.numbers
      errors.add(:numbers, 'You can only play the same number once')
    end
  end

  def uniq_stars
    unless self.stars.uniq == self.stars
      errors.add(:stars, 'You can only play the same star once')
    end
  end
end

