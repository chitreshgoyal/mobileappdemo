class Role < ActiveRecord::Base
  attr_accessible :id, :name, :role_id, :feature_ids
  has_many :usres, :dependent => :destroy
  has_many :permissions
  has_many :features, :through => :permissions
end
