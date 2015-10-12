class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.column :species_id, :integer
      t.column :lat, :float
      t.column :long, :float
      t.column :date, :date

      t.timestamps null: false
    end
  end
end
