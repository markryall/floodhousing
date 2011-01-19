namespace :floods do

  namespace :report do

    task :unconfirmed_listings => :environment do
      unconfirmed = Accommodation.where("created_at == updated_at and available == 'f'").count
      puts "Currently unconfirmed listings: #{unconfirmed}"
    end
    
  end

end
