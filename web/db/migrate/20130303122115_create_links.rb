class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.references :content, :polymorphic => true

      t.timestamps
    end

    add_index :links, [:content_type, :content_id]
  end
end