class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bet
  monetize :amount_cents
end
