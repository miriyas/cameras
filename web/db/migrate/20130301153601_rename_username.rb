class RenameUsername < ActiveRecord::Migration
	def self.up
    rename_column :users, :username, :name
  end
end
