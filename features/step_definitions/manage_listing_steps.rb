Then /^I will shown a form to update the listing at "([^"]*)"$/ do |address1|
   on(EditListingPage) do |page|
     page.address_1.should eql address1
   end  
end