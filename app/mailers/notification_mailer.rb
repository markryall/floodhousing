class NotificationMailer < ActionMailer::Base
  default :from => "ozfloodhelp@getup.org.au"
  helper :application
  
  def accommodation_listed(accommodation)
    headers["X-SMTPAPI"] = disable_opentrack.to_json
    headers["Precedence"] = "bulk"
    @accommodation = accommodation
    person_name = @accommodation.name || 'Friend'
    @salutation = person_name.split(/\s/).first || 'Friend'
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
