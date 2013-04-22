class UserMailer < ActionMailer::Base
  default from: "chitresh.goyal@thepsi.com"
  
   def welcome_email(user)
    @user = user
    @url  = "http://localhost:300/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
  
  def verification_instructions(user)
    @user = user
    @verification_url = user_verification_url(user.perishable_token)
    mail(:to => user.email, :subject => "Account Verification")
  end
  
end
