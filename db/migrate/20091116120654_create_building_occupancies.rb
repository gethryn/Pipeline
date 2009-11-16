class CreateBuildingOccupancies < ActiveRecord::Migration
  def self.up
    create_table :building_occupancies do |t|
      t.integer :building_id
      t.string :business_unit
      t.integer :capacity

      t.timestamps
    end
  end

  def self.down
    drop_table :building_occupancies
  end
end
