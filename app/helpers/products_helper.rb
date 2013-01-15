module ProductsHelper
  def poly(s)
    h = Hash.new(0)
    s.split('').each { | v | h.store(v, h[v]+1) }
    count = 0
    h.values.each do |l|
      if l%2 != 0
      count = count+1
      end
    end
     if count>1
      return false
     else
      return true
     end
  end
  
  def sort_data(abc)
    @sorted = abc.sort! {|a,b| b[:created_at] <=> a[:created_at]}
    
    @result = []
    @temp = []

    @sorted.map {|a| a.created_at<=DateTime.now ? @result<<a : @temp<<a}
    
    return @result<<@temp
  end
    
end
