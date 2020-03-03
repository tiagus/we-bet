class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.integer :numbers, array: true, null: false
      t.integer :stars, array: true, null: false
      t.boolean :milhao, default: false
      t.integer :number_of_weeks, default: 1
      t.boolean :auto_renew, default: false
      t.string :status, array: true, null: false
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.references :draw, foreign_key: true

      t.timestamps
    end
  end
end
