class PostObserver < ActiveRecord::Observer
  def after_create(post)
    Notifications.comment("admin@do.com", "New comment was posted", comment).deliver
  end
end
