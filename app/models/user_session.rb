class UserSession < Authlogic::Session::Base
   #attr_accessible :id, :session_id, :data, :created_at, :updated_at
end
class User < ActiveRecord::Base
  attr_accessible :id, :session_id, :data, :created_at, :updated_at
end