class CreateTanks < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.string :name
      t.integer :year
      t.integer :country_id
      t.integer :type_id

      t.timestamps null: false
    end
  end
end
