class Permission < ActiveRecord::Base
  attr_accessible :feature_id, :role_id
  belongs_to :feature
  belongs_to :role
  #set_primary_key = :role_id
end
