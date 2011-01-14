class Accommodation < ActiveRecord::Base

  validates_acceptance_of :over_eighteen, :accept=>true, :message => 'must be over 18'
  
  def self.per_page
    25
  end
  
  def self.search_by_suburb(search, page)
    paginate :per_page => per_page, :page => page,
             :conditions => ['suburb like ?', "%#{search}%"], :order => 'id'
  end
  
  def complete_address
    [address1, address2, suburb].collect { |x|
      x.empty? ? nil : x
    }.compact.join(', ')         
  end
  
end
