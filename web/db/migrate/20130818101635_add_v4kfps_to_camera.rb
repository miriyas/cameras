class AddV4kfpsToCamera < ActiveRecord::Migration
  def self.up
    add_column :cameras, :v4000fps, :integer, :default => nil
    add_column :cameras, :v4000scan, :string, :default => nil
	end
end
