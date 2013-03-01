class AddRoleToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string, :default => nil
  end
end
