class NotificationMailer < ActionMailer::Base
  default :from => ENV['MAIL_SENDER'] || "OzFloodHelp <ozfloodhelp@getup.org.au>"
  helper :application
  
  def accommodation_listed(accommodation)
    headers["X-SMTPAPI"] = disable_opentrack_header
#    headers["Precedence"] = "bulk"
    @accommodation = accommodation
    person_name = @accommodation.name || ''
    @salutation = person_name.split(/\s/).first
    if @salutation.nil?
      subj = "Please confirm your offer of help"
      dest = "#{accommodation.email}"
    else
      subj = "#{@salutation.titleize}, please confirm your offer of help."
      dest = "#{accommodation.name} <#{accommodation.email}>"
    end
    mail(:to => dest, :subject => subj)
  end
  
  def register_interest(accommodation, seeker)
    headers["X-SMTPAPI"] = disable_opentrack_header
    @seeker = seeker
    @accommodation = accommodation
    mail(:to => "#{accommodation.name} <#{accommodation.email}>", 
         :subject => "A message from someone looking for a place to stay")
  end

  private

  def disable_opentrack_header
    { "filters" => { "opentrack" => { "settings" => {"enable" => "0"}}}}.to_json
  end
end
