class AddMountToCamera < ActiveRecord::Migration
  def self.up
    add_column :cameras, :mount, :string, :default => nil
  end
end
