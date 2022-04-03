class CreateSightings < ActiveRecord::Migration[7.0]
  def change
    create_table :sightings do |t|
      t.datetime :date
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
