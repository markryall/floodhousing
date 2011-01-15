class NotificationMailer < ActionMailer::Base
  default :from => "floodhousing@thoughtworks.com"
  helper :application
  
  def accommodation_listed(accommodation)
    @accommodation = accommodation
    mail(:to => "#{accommodation.name} <#{accommodation.email}>", :subject => "Your accommodation has been listed")
  end
end
