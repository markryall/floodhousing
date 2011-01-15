class NotificationMailer < ActionMailer::Base
  default :from => "from@example.com"
  helper :application
  
  def accommodation_listed(accommodation)
    @accommodation = accommodation
    mail(:to => "#{accommodation.name} <#{accommodation.email}>", :subject => "Your accommodation has been listed")
  end
end