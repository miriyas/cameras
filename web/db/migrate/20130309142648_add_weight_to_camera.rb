class AddWeightToCamera < ActiveRecord::Migration
  def self.up
    add_column :cameras, :weight, :int, :default => nil
    add_column :cameras, :d_width, :int, :default => nil
    add_column :cameras, :d_height, :int, :default => nil
    add_column :cameras, :d_depth, :int, :default => nil
  end
end
