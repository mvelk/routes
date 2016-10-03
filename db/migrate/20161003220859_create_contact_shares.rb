class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, unique:true, null:false
      t.integer :user_id, unique:true, null:false
    end
  end
end
