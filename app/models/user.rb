class User < ActiveRecord::Base
   attr_accessible :id,:name,:login,:crypted_password,:password,:password_confirmation,:password_salt,:email,:persistence_token,:single_access_token,:perishable_token,:login_count,:failed_login_count,:last_request_at,:current_login_at,:last_login_at,:current_login_ip,:last_login_ip,:created_at,:updated_at
   
  
   acts_as_authentic do |c|

  end
end
