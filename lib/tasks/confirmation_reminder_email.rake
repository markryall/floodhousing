namespace :floods do 
  desc "Send a reminder email for people who haven't confirmed their listing yet" 
  task :confirmation_reminder_email => :environment do 
    puts Rails.env
    Accommodation.find_unconfirmed.each do |listing|
       NotificationMailer.confirmation_reminder(listing).deliver 
       Rails.logger.info "Sent reminder email to #{listing.email}"
    end
  end 
end