class CreateOpportunities < ActiveRecord::Migration
  def self.up
    create_table :opportunities do |t|
      t.integer :floor_id
      t.integer :num_seats_departing
      t.string :floor_id_arriving
      t.integer :num_seats_arriving
      t.string :business_unit
      t.string :team
      t.string :move_type, :default => 'MOVE'
      t.text :notes
      t.string :status, :default => 'Opportunity'
      t.boolean :key_move, :default => false
      t.boolean :applied, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :opportunities
  end
end
