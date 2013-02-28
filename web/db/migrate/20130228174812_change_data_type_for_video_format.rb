class ChangeDataTypeForVideoFormat < ActiveRecord::Migration
	def self.up
		change_column :cameras, :video_format, :string
  end
end
