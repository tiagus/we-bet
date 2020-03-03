class Profile < ApplicationRecord
  belongs_to :user


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :bio, length: { maximum: 500 }
  validates :nif, length: { is: 9 }, numericality: { only_integer: true }
end
