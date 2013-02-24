class ChangeDataTypeForReleaseDate < ActiveRecord::Migration
	def self.up
		change_column :cameras, :release_date, :date
  end
end
