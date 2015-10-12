class AddDayIdToSightings < ActiveRecord::Migration
  def change
    add_column :sightings, :day_id, :integer
  end
end
