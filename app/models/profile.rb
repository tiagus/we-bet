class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :bio, length: { maximum: 500 }
  validates :date_of_birth, presence: true
  validate :validate_age

  private

  def validate_age
    if date_of_birth.present? && date_of_birth.to_s.to_date > 18.years.ago.to_date
      errors.add(:date_of_birth, 'You should be over 18 years old in order to bet.')
    end
  end
