class CreateWeaponsInTanks < ActiveRecord::Migration
  def change
    create_table :weapons_in_tanks do |t|
      t.integer :tank_id
      t.integer :weapon_id

      t.timestamps null: false
    end
  end
end
