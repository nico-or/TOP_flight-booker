class CreateCountry < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :code
      t.string :name
      t.belongs_to :continent
      t.timestamps
    end
  end
end
