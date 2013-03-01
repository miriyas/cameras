class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :name

      t.references :content, :polymorphic => true

      t.text :body
      t.string :user_ip
      t.string :password

      t.timestamps
    end

    add_index :comments, [:content_type, :content_id]
  end
end