When /^I fill in details about the accommodation I can offer$/ do |table|
  listing = table.rows_hash
  goto(CreateListingPage) do |page|
    page.create_listing listing 
  end
end

Then /^I will see confirmation$/ do
  on(ThankYouPage)
end

Given /^that no listings have been posted$/ do
   # don't need to do anything!
end


#TODO - this passing @accomodation around between steps really sucks - find a better way

Given /^that a listing has been posted$/ do
  @accommodation = Accommodation.make
end

Given /^that listing has already been taken$/ do
  raise "This step expects an accomodation to have been set up by a previous step" if @accommodation.nil?
  @accommodation.available = false
  @accommodation.save!
end


Given /^that (\d+) listings have been posted$/ do |number_of_listings|
  number_of_listings.to_i.times {Accommodation.make}
end

Given /^a listing at "([^"]*)" was posted ([^"]*)$/ do |address, time|
  address_1, address_2, suburb = address.split(', ')
  Delorean.time_travel_to(time) do
    Accommodation.make(:address1 => address_1, :address2 => address_2, :suburb => suburb).inspect
  end
end

