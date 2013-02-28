class AddVideoScanningToCameras < ActiveRecord::Migration
  def self.up
    add_column :cameras, :video_scanning, :string, :default => nil
    add_column :cameras, :more_info, :text, :default => nil
  end
end
