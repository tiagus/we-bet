class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.references :user, foreign_key: true
      t.date :date_of_birth
      t.string :nif
      t.text :bio

      t.timestamps
    end
  end
end
