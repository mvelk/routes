class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, presence: true
      t.string :email, presence: true
      t.integer :user_id, presence: true
    end
  end
end
