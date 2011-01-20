namespace :floods do
  namespace :report do
    task :listings => :environment do
      total = Accommodation.count
      available = Accommodation.where(:available => true).count
      unconfirmed = Accommodation.where(:enabled => false).where(:available => false).count
      contacts = Accommodation.sum(:contact_count)
      puts "Total listings:\t\t#{total}"
      puts "Unconfirmed listings:\t#{unconfirmed}"
      puts "Available listings:\t#{available}"
      puts "Unavailable listings:\t#{total-(available+unconfirmed)}"
      puts "Total contacts:\t\t#{contacts}"
    end
  end
end