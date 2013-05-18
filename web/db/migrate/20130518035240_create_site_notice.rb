class CreateSiteNotice < ActiveRecord::Migration
  def change
    create_table :site_notices do |t|
      t.text :worked
      t.text :todo

      t.timestamps
    end
  end
end
