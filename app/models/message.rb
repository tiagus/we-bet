class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :body, :group_id, :user_id, presence: true


private

  def message_time
    created_at.strftime("%d/%m/%y at %l:%M %p")
  end
end
