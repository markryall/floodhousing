class Accommodation < ActiveRecord::Base
  
  validates_acceptance_of :over_eighteen, :message => 'must be over 18'
  
  def complete_address
    [address1, address2, suburb].collect { |x|
      x.empty? ? nil : x
    }.compact.join(', ')         
  end
  
end