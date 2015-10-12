class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.column :date, :date
      
      t.timestamps null: false
    end
  end
end
