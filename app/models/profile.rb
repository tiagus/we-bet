class Profile < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :bio, length: { maximum: 500 }
  validates :nif, length: { is: 9 }, numericality: { only_integer: true }
  validates :date_of_birth, presence: true
  validate :validate_age

  private

  def validate_age
    if date_of_birth.present? && date_of_birth.to_s.to_date > 18.years.ago.to_date
      errors.add(:date_of_birth, 'You should be over 18 years old.')
    end
  end

end

