class User < ActiveRecord::Base
  attr_accessible :id,:name,:login,:crypted_password,:password,:password_confirmation,:password_salt,:email,:persistence_token,:single_access_token,:perishable_token,:login_count,:failed_login_count,:last_request_at,:current_login_at,:last_login_at,:current_login_ip,:last_login_ip,:created_at,:updated_at,:role_id
  attr_accessible :captcha, :captcha_key
  
  apply_simple_captcha   
  belongs_to :role
  
  validates_presence_of :login, :password
  
  acts_as_authentic do |c|
    c.validates_format_of :login, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
    c.validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
  end
end
