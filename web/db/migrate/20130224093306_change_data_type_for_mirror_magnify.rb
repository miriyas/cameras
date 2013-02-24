class RenameMirrorMagnify < ActiveRecord::Migration
	def self.up
    rename_column :cameras, :mirror_magnify, :finder_magnify
    rename_column :cameras, :mirror_coverage, :finder_coverage
  end
end
