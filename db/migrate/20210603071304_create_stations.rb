class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :stationName
      t.integer :timeWalk
      t.string :railName

      t.timestamps
    end
  end
end
