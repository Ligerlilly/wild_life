class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.column :name, :string

      t.timestamps null: false
    end
  end
end
