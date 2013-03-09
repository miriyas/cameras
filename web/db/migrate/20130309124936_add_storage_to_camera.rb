class AddStorageToCamera < ActiveRecord::Migration
  def self.up
    add_column :cameras, :storage, :string, :default => nil
  end
end
