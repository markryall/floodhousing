module AccommodationsHelper
  
  def empty_default(value)
    value.empty? ? "--" : value 
  end
  
end
