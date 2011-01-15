Given /^that no listings have been posted$/ do
   # don't need to do anything!
end


#TODO - this passing @accomodation around between steps really sucks - find a better way

Given /^that a listing has been posted$/ do
  @accomodation = Accommodation.make
end

Given /^that listing has already been taken$/ do
  raise "This step expects an accomodation to have been set up by a previous step" if @accomodation.nil?
  @accomodation.taken
end