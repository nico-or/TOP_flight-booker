class CreateAirport < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :code
      t.string :name
      t.belongs_to :country
      t.timestamps
    end
  end
end
