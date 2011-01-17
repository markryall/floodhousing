class NotificationMailer < ActionMailer::Base
  default :from => "ozfloodhelp@getup.org.au"
  helper :application
  
  def accommodation_listed(accommodation)
    headers["X-SMTPAPI"] = disable_opentrack.to_json
    @accommodation = accommodation
    @salutation = (@accommodation.name || 'Friend').split(/\s/).first
    @salutation = 'Friend' if @salutation.blank?
    mail(:to => "#{accommodation.name} <#{accommodation.email}>", :subject => "Your accommodation has been listed")
  end
  
  def register_interest(accommodation, seeker)
    @seeker = seeker
    @accommodation = accommodation
    mail(:to => "#{accommodation.name} <#{accommodation.email}>", :subject => "Flood housing - a message from someone looking for a place to stay")
  end

  private

  def disable_opentrack
    { "opentrack" => {"category" => "newuser"} }.to_json
  end
end
