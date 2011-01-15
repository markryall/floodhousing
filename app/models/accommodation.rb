class Accommodation < ActiveRecord::Base

  validates_acceptance_of :over_eighteen, :accept=>true, :message => 'must be over 18'
  validates_presence_of :number_of_beds, :message => 'Come on - please tell us the number of beds'
  
  def self.per_page
    50
  end
  
  def self.search(query, page)
    paginate :per_page => per_page, :page => page,
             :conditions => query.to_sql_conditions, 
             :order => 'created_at DESC'
  end
  
  def taken
    self.available = false
    save!
  end
  
  def complete_address
    [address1, address2, suburb].collect { |x|
      x.empty? ? nil : x
    }.compact.join(', ')         
  end
  
end
