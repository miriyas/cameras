class AddName3ToCameras < ActiveRecord::Migration
  def self.up
    add_column :cameras, :name3, :string, :default => nil
  end
end
