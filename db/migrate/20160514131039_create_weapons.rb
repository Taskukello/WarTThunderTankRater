class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :size
      t.integer :year

      t.timestamps null: false
    end
  end
end
