class Group < ApplicationRecord
  belongs_to :user
  has_many :bets
  has_many :group_users
  has_many :users, through: :group_users

  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 500 }

  def privacy
    if public
      'Public'
    else
      'Private'
    end
  end
end
