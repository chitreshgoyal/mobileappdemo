module PostsHelper
  def archive
    Post.all.group_by { |t| t.created_at.beginning_of_month  }
  end
  
end
