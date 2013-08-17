class AddClassrangeToCamera < ActiveRecord::Migration
  def self.up
    add_column :cameras, :class_range_id, :integer, :default => nil
		remove_column :cameras, :class_range
	end
end
