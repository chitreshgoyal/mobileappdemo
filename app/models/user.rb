class User < ActiveRecord::Base

  apply_simple_captcha :message => "The secret Image and code were different", :add_to_base => true

  attr_accessible :id,:name,:login,:crypted_password,:password,:password_confirmation,:password_salt,:email
  attr_accessible :persistence_token,:single_access_token,:perishable_token,:login_count,:failed_login_count
  attr_accessible :last_request_at,:current_login_at,:last_login_at,:current_login_ip,:last_login_ip,:created_at,:updated_at,:role_id
  attr_accessible :captcha, :captcha_key, :profile_pic, :verified

  
  belongs_to :role
  has_many :posts
  
  validates_presence_of :name, :login, :email, :password
  validates_uniqueness_of :login, :email, :message => "is invalid"
  validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i


  has_attached_file :profile_pic, :styles => { :medium => "200x200>", :thumb => "32x32>" }, :default_url => "user.jpg"

  acts_as_authentic do |c|
  end
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    UserMailer.deliver_password_reset_instructions(self)  
  end

  def deliver_verification_instructions!
    reset_perishable_token!
    UserMailer.verification_instructions(self).deliver
  end
  
  # verify user using verification_instruction url
  def verify!
    self.update_attribute(:verified,"true")
  end
  
end
