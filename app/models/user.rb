class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bets
  has_many :owned_groups, class_name: 'Group', foreign_key: 'user_id'
  has_many :group_users
  has_one :profile
  has_many :groups, through: :group_users

  #has_many :managers, through: :listing_managers, class_name: "User", foreign_key: "manager_id"


  def profile?
    !profile.nil?
  end
end
