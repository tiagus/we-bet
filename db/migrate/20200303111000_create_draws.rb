class CreateDraws < ActiveRecord::Migration[5.2]
  def change
    create_table :draws do |t|
      t.integer :numbers, array: true
      t.integer :stars, array: true
      t.date :draw_date, null: false
      t.jsonb :prizes
      t.date :closing_date, null: false

      t.timestamps
    end
  end
end
