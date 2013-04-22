class UserSession < Authlogic::Session::Base
   #attr_accessible :id, :session_id, :data, :created_at, :updated_at
   validate :check_if_verified
   
  private

  def check_if_verified
    errors.add(:base, "You have not yet verified your account") unless attempted_record && attempted_record.verified
  end
  
end
