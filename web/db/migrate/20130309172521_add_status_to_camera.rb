class AddStatusToCamera < ActiveRecord::Migration
  def self.up
    add_column :cameras, :status, :string, :default => nil
  end
end
