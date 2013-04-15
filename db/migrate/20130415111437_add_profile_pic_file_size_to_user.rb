class AddProfilePicFileSizeToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_pic_file_size, :integer
  end
end
