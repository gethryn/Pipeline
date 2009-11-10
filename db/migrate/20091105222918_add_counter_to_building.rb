class AddCounterToBuilding < ActiveRecord::Migration
  def self.up
    add_column :buildings, :floors_count, :integer, :default => 0
    add_column :floors, :opportunities_count, :integer, :default => 0
    add_index :floors, :building_id
    add_index :opportunities, :floor_id
  end

  def self.down
    remove_column :buildings, :floors_count
    remove_column :floors, :opportunities_count
    remove_index :floors, :building_id
    remove_index :opportunities, :floor_id
  end
end
