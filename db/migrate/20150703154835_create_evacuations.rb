class CreateEvacuations < ActiveRecord::Migration
  def change
    create_table :evacuations do |t|
      t.text :evac
      t.text :address
      t.text :earthquake
      t.text :tsunami
      t.text :flood
      t.text :surge
      t.text :landslide
      t.text :fire
      t.text :inlandwaters

      t.timestamps null: false
    end
  end
end
