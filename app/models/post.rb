class Post < ActiveRecord::Base
  attr_accessible :end_date, :heading, :keywords, :published_date, :resources, :user_id, :description
end
