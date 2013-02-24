class ChangeDataTypeForFinderMagnify < ActiveRecord::Migration
	def self.up
		change_column :cameras, :finder_magnify, :float
		change_column :cameras, :finder_coverage, :integer
		change_column :cameras, :fps, :float
		change_column :cameras, :lcd_size, :float
		change_column :cameras, :shake_reduction, :boolean
  end
end