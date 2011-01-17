class NotificationMailer < ActionMailer::Base
  default :from => ENV['MAIL_SENDER'] || "Alex Cooper - GetUp! <info@getup.org.au>"
  helper :application
  
  def accommodation_listed(accommodation)
    headers["X-SMTPAPI"] = disable_opentrack_header
    headers["Precedence"] = "bulk"
    @accommodation = accommodation
    person_name = @accommodation.name || ''
    @salutation = person_name.split(/\s/).first
    if @salutation.nil?
      subj = "[OzFloodHelp] Your accommodation has been listed"
      dest = "#{accommodation.email}"
    else
      subj = "[OzFloodHelp] #{@salutation.titleize}, your accommodation has been listed."
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
