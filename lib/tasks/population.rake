namespace :floods do
  
  task :populate => :environment do
    list_count = ENV['LISTINGS'].to_i
    list_count.times do
      Accommodation.create!(
        :number_of_beds => '3',
        :address1 => '1/509 Factory',
        :address2 => 'Street',
        :suburb => 'FactoryVille',
        :area => 'Ipswich',
        :number_of_beds => "1",
        :email => "foo@bar.com",
        :over_eighteen => true,
        :terms_and_conditions_accepted => true,
        :postcode => "3184")
    end
  end

end