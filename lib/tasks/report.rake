namespace :floods do

  namespace :report do

    task :listings => :environment do
      total = Accommodation.count
      available = Accommodation.where(:available => true).count
      unconfirmed = Accommodation.where("created_at = updated_at and available = 'f'").count
      contacts = Accommodation.sum(:contact_count)
      puts "Total listings:\t\t#{total}"
      puts "Available listings:\t#{available}"
      puts "Unconfirmed listings:\t#{unconfirmed}"
      puts "Total contacts:\t\t#{contacts}"
    end
    
  end

end
