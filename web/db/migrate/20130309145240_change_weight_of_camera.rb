class ChangeWeightOfCamera < ActiveRecord::Migration
	def self.up
		change_column :cameras, :weight, :float
		change_column :cameras, :d_width, :float
		change_column :cameras, :d_height, :float
		change_column :cameras, :d_depth, :float
  end
end
