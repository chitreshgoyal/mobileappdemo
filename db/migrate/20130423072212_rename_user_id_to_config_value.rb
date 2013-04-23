class RenameUserIdToConfigValue < ActiveRecord::Migration
  def up
    rename_column :settings, :user_id, :config_value
    change_column :settings, :config_value, :string
  end

  def down
    change_column :settings, :config_value, :integer
    rename_column :settings, :config_value, :user_id
  end
end
