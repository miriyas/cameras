class AddSealingToCamera < ActiveRecord::Migration
  def self.up
    add_column :cameras, :sealing, :boolean, :default => false
  end
end
