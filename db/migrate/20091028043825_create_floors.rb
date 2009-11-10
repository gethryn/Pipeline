class CreateFloors < ActiveRecord::Migration
  def self.up
    create_table :floors do |t|
      t.integer :building_id
      t.string :floor_level
      t.boolean :active, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :floors
  end
end
