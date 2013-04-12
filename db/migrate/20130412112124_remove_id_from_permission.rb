class RemoveIdFromPermission < ActiveRecord::Migration
  def up
    remove_column :permissions, :Id
  end

  def down
    add_column :permissions, :Id, :integer
  end
end
