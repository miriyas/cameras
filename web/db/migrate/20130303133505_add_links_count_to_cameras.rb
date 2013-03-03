class AddLinksCountToCameras < ActiveRecord::Migration
  def self.up
    add_column :cameras, :links_count, :integer, :default => nil
  end
end
