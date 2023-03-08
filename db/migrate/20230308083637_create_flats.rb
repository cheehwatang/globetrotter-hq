class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.text :description, null: false
      t.integer :price_per_night, null: false
      t.integer :number_of_guests, null: false

      t.timestamps
    end
  end
end
