class AddLatToBuildings < ActiveRecord::Migration
  def self.up
    add_column :buildings, :lat, :float
    add_column :buildings, :lng, :float
    
  end

  def self.down
    remove_column :buildings, :lat
    remove_column :buildings, :lng
  end
end
