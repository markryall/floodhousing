class Accommodation < ActiveRecord::Base
  validates_acceptance_of :over_eighteen, :accept=>true, :message => 'You must be over 18'
  validates_acceptance_of :terms_and_conditions_accepted, :accept=>true, :message => 'Please accept the terms and conditions'
  validates_presence_of :number_of_beds, :message => 'Please tell us the number of beds'
  validates_presence_of :area, :message => 'Please tell us the area'
  validates_presence_of :email, :message => 'Please tell us your email address'
  validates :email, :email => true
  
  validates_confirmation_of :email, :message => 'Your email must match the confirmation email'
  validates_presence_of :suburb, :message => 'Please tell us the suburb'
  validates_presence_of :postcode, :message => 'Please tell us the postcode'
  validates_format_of :postcode, :with => /\d{4}/, :message => "Postcode must be 4 digits eg. 4000"
  validates :phone_home, :phone_mobile, :other_phone, :phone => true
  
  def self.per_page
    20
  end
  
  def self.search(query, page)
    paginate :per_page => per_page, :page => page,
             :conditions => query.to_sql_conditions, 
             :order => 'created_at DESC'
  end

  def self.all_contact_count
    sum(:contact_count)
  end
  
  def self.find_unconfirmed
    Accommodation.where('created_at = updated_at')    
  end
  
  def self.confirm(ids)
    ids.each do |id|
      accommodation = Accommodation.find(id)
      accommodation.update_attributes(:updated_at => Time.now)
    end
  end
  
  def complete_address
    address_formatter([address1, address2, suburb])
  end

  def restricted_address
    address_formatter([suburb, postcode, area])
  end

  def authorization_token
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest::MD5.new, Rails.application.config.secret_token, id.to_s).to_i(16).to_s(36)
  end

  def record_contact
    Accommodation.transaction do
      reload
      update_attributes!(:contact_count => contact_count + 1)
    end
  end

  private
  def address_formatter(field_arr)
    field_arr.collect { |x|
      x.empty? ? nil : x
    }.compact.join(', ')
  end
end
