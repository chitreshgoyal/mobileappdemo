class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :id
      t.integer :role_id
      t.integer :feature_id

      t.timestamps
    end
  end
end
