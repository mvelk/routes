class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.string :body, null: false
      t.integer :contact_id
      t.integer :user_id
      t.integer :contact_share_id
    end

    add_index :comments, :contact_id
    add_index :comments, :user_id
    add_index :comments, :contact_share_id
  end

end
