class AddProfilePicFileNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_pic_file_name, :string
  end
end
