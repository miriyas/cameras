class CreateClassRanges < ActiveRecord::Migration
  def change
    create_table :class_ranges do |t|
      t.string :title
      t.integer :position
	    t.string :size
	    t.string :range

      t.timestamps
    end
  end
end
