class CreateStaticItems < ActiveRecord::Migration
  def self.up
    create_table :static_items do |t|
      t.string :list_name
      t.string :list_item

      t.timestamps
    end
  end

  def self.down
    drop_table :static_items
  end
end
