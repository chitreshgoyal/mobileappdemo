class Permission < ActiveRecord::Base
  attr_accessible :feature_id, :role_id
  belongs_to :feature
  belongs_to :role
  serialize :feature_id
end
