class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :id
      t.integer :user_id
      t.string :admin_email

      t.timestamps
    end
  end
end
