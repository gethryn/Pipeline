class AddCapacityToFloor < ActiveRecord::Migration
  def self.up
    add_column :floors, :capacity, :integer, :default => 0
  end

  def self.down
    remove_column :floors, :capacity
  end
end
