class AddDateToOpportunity < ActiveRecord::Migration
  def self.up
    add_column :opportunities, :est_date, :date
  end

  def self.down
    remove_column :opportunities, :est_date
  end
end
