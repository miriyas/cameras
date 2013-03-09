class AddPowerToCamera < ActiveRecord::Migration
  def self.up
    add_column :cameras, :power, :string, :default => nil
  end
end