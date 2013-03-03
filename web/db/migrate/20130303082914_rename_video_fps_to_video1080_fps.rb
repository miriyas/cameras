class RenameVideoFpsToVideo1080Fps < ActiveRecord::Migration
	def self.up
    rename_column :cameras, :video_resolution, :v720fps
    rename_column :cameras, :video_fps, :v1080fps
    rename_column :cameras, :video_scanning, :v1080scan
    add_column :cameras, :v720scan, :string, :default => nil
  end
end
