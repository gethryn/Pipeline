class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.string :name
      t.string :short_name
      t.string :state
      t.string :suburb
      t.string :building_zone, :default => 'CBD'
      t.boolean :available_for_sip

      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end
