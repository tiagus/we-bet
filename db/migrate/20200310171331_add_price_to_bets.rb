class AddPriceToBets < ActiveRecord::Migration[5.2]
  def change
    add_monetize :bets, :price, default: 250
  end
end
