class AddFarMoreInfoToCamera < ActiveRecord::Migration
  def self.up
    add_column :cameras, :far_more_info, :text, :default => nil
	end
end
