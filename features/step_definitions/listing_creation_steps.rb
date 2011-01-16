Given /^I fill in details about the accommodation I can offer$/ do |table|
  listing = table.rows_hash
  goto(CreateListingPage) do |page|
    page.create_listing listing 
  end
end

Then /^I will see confirmation$/ do
  pending # express the regexp above with the code you wish you had
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
