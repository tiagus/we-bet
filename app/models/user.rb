class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bets
  has_many :groups
  has_one :profile
  has_many :groups, through: :group_users




  def profile?
    !profile.nil?
  end

  def full_name
    if profile?
      "#{profile.first_name} #{profile.last_name}"
    else
      ""
    end
  end
end
