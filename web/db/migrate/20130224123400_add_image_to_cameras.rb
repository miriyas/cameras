class AddImageToCameras < ActiveRecord::Migration
  def self.up
    add_column :cameras, :image, :string, :default => nil
  end
end
