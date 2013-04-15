class AddProfilePicContentTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_pic_content_type, :string
  end
end
