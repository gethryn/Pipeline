class AddPostcodeToBuilding < ActiveRecord::Migration
  def self.up
    add_column :buildings, :postcode, :string
  end

  def self.down
    remove_column :buildings, :postcode
  end
end
