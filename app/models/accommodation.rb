class Accommodation < ActiveRecord::Base
  
  def complete_address
    [address1, address2, suburb].collect { |x|
      x.empty? ? nil : x
    }.compact.join(', ')         
  end
  
end