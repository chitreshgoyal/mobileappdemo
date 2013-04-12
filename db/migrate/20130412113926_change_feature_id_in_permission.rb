class ChangeFeatureIdInPermission < ActiveRecord::Migration
  def up
    change_column :permissions, :feature_id, :string
  end

  def down
    change_column :permissions, :feature_id, :integer
  end
end
