class NotificationMailer < ActionMailer::Base
  default :from => "OzFloodHelp <ozfloodhelp@getup.org.au>"
  helper :application
  
  def accommodation_listed(accommodation)
    headers["X-SMTPAPI"] = disable_opentrack_header
    headers["Precedence"] = "bulk"
    @accommodation = accommodation
    person_name = @accommodation.name || 'Friend'
    @salutation = person_name.split(/\s/).first || 'Friend'
    if @salutation == "Friend"
      subj = "Your accommodation has been listed"
      dest = "#{accommodation.email}"
    else
      subj = "Thanks #{@salutation}, your accommodation has been listed."
      dest = "#{accommodation.name} <#{accommodation.email}>"
    end
    mail(:to => dest, :subject => subj)
  end
  
  def register_interest(accommodation, seeker)
    @seeker = seeker
    @accommodation = accommodation
    mail(:to => "#{accommodation.name} <#{accommodation.email}>", 
         :subject => "Flood housing - a message from someone looking for a place to stay")
  end

  private

  def disable_opentrack_header
    { "filters" => { "opentrack" => { "settings" => {"enable" => "0"}}}}.to_json
  end
end
