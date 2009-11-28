class CreateOpportunityItems < ActiveRecord::Migration
  def self.up
    create_table :opportunity_items do |t|
      t.integer :opportunity_id
      t.integer :from_floor_id
      t.integer :from_floor_seats
      t.integer :to_floor_id
      t.integer :to_floor_seats
      t.string :cost_centre
      t.string :team_name
      t.string :contact_name
      t.text :notes
      t.timestamps
    end
  end
  
  def self.down
    drop_table :opportunity_items
  end
end
