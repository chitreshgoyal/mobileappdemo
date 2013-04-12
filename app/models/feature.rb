class Feature < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :permissions
end
