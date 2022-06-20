class CreateBookingsPassengersJoinTable < ActiveRecord::Migration[7.0]
  def up
    create_join_table :bookings, :passengers do |t|
      t.index :booking_id
      t.index :passenger_id
    end

    remove_column :bookings, :passenger_id
  end

  def down
    drop_table :bookings_passengers

    change_table :bookings do |t|
      t.references :passenger, null: false, foreign_key: true
    end
  end
end
