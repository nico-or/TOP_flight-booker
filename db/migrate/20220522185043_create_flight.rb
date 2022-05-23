class CreateFlight < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :destination_airport_id
      t.foreign_key :airports, column: :departure_airport_id
      t.foreign_key :airports, column: :destination_airport_id
      t.datetime :departure
      t.integer :duration
      t.timestamps
    end
  end
end
