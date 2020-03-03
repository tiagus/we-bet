class ChangeNifToBeIntegerInProfiles < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :nif, :integer, using: 'nif::integer'
  end
end
