class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.st_polygon :coordinates, geographic: true, srid: 4326

      t.timestamps
    end
  end
end
