class AddUsernameToOpportunity < ActiveRecord::Migration
  def self.up
    add_column :opportunities, :user_id, :integer
    add_index :opportunities, :user_id
  end
  
  

  def self.down
    remove_column :opportunities, :user_id
    remove_index :opporuntieis, :user_id
  end
end
