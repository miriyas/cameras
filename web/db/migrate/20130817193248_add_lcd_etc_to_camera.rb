class AddLcdEtcToCamera < ActiveRecord::Migration
  def self.up
    add_column :cameras, :lcd_etc, :string, :default => nil
  end
end
