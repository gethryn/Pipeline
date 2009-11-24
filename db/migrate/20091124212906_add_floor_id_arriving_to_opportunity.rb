class AddFloorIdArrivingToOpportunity < ActiveRecord::Migration
  def self.up
    remove_column :opportunities, :floor_id_arriving
    add_column :opportunities, :floor_id_arriving, :integer
  end

  def self.down
    remove_column :opportunities, :floor_id_arriving
    add_column :opportunities, :floor_id_arriving, :string
  end
end
