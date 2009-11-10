class AddImageToStaticItem < ActiveRecord::Migration
  def self.up
    add_column :static_items, :list_key, :string
    add_column :static_items, :list_img, :string
  end

  def self.down
    remove_column :static_items, :list_img
    remove_column :static_items, :list_key
  end
end
