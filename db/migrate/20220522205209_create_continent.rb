class CreateContinent < ActiveRecord::Migration[7.0]
  def change
    create_table :continents do |t|
      t.string :code
      t.string :name
      t.timestamps
    end
  end
end
