class Group < ApplicationRecord
  belongs_to :user
  has_many :bets, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 500 }

  def privacy
    if public
      'Public'
    else
      'Private'
    end
  end

  def has_member?(user)
    !group_users.where(user: user).empty?
  end

end
