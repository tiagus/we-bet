class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bets
  has_many :groups
  has_many :groups, through: :group_users

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :bio, length: { maximum: 500 }
  validates :nif, length: { maximum: 9 }, numericality: { only_integer: true }
end
