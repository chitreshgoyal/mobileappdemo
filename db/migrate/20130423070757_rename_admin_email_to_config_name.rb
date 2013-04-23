class RenameAdminEmailToConfigName < ActiveRecord::Migration
  def up
    rename_column :settings, :admin_email, :config_name
  end

  def down
    reanme_column :settings, :config_name, :admin_email
  end
end
