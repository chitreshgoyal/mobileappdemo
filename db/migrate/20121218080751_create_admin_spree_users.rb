class CreateAdminSpreeUsers < ActiveRecord::Migration
  def change
    create_table :admin_spree_users do |t|

      t.timestamps
    end
  end
end
