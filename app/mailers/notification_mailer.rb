class NotificationMailer < ActionMailer::Base
  default :from => "ozfloodhelp@getup.com.au"
  helper :application
  
  def accommodation_listed(accommodation)
    @accommodation = accommodation
    mail(:to => "#{accommodation.name} <#{accommodation.email}>", :subject => "Your accommodation has been listed")
  end
  
  def register_interest(accommodation, seeker)
    @seeker = seeker
    @accommodation = accommodation
    mail(:to => "#{accommodation.name} <#{accommodation.email}>", :subject => "Someone is interested in your accommodation")
  end
end
