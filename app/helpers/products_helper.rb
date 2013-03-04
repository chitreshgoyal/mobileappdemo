module ProductsHelper

  def sort_data(abc)
    @sorted = abc.sort! {|a,b| b[:created_at] <=> a[:created_at]}
    
    @result = []
    @temp = []

    @sorted.map {|a| a.created_at<=DateTime.now ? @result<<a : @temp<<a}
    
    return @result<<@temp
  end
    
end
