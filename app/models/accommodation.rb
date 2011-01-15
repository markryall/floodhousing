class Accommodation < ActiveRecord::Base

  validates_acceptance_of :over_eighteen, :accept=>true, :message => 'must be over 18'
  validates_acceptance_of :terms_and_conditions_accepted, :accept=>true, :message => 'must be accepted'
  validates_presence_of :number_of_beds, :message => 'Please tell us the number of beds'
  validates_presence_of :email, :message => 'Please tell us your email address'
  validates_confirmation_of :email
  validates_presence_of :suburb, :message => 'Please tell us the suburb'
  validates_presence_of :postcode, :message => 'Please tell us the postcode'
  validates_format_of :postcode, :with => /\d{4}/, :message => "Postcode must be 4 digits eg. 4000"
  
  validates_presence_of :state, :message => 'Please tell us the state'
  
  def self.per_page
    50
  end
  
  def self.search(query, page)
    paginate :per_page => per_page, :page => page,
             :conditions => query.to_sql_conditions, 
             :order => 'created_at DESC'
  end
  
  def complete_address
    [address1, address2, suburb].collect { |x|
      x.empty? ? nil : x
    }.compact.join(', ')         
  end

  def authorization_token
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest::MD5.new, Rails.application.config.secret_token, id.to_s).to_i(16).to_s(36)
  end
end
