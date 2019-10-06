class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name, nil: false
      t.st_point :coordinates, geographic: true, srid: 4326
      t.jsonb :geocoder_data

      t.timestamps
    end

    add_index :locations, :name, unique: true
  end
end
