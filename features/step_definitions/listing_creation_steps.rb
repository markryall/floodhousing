Given /^I fill in details about the accommodation I can offer$/ do |table|
  listing = table.rows_hash
  goto(CreateListingPage) do |page|
    page.create_listing listing 
  end
end

Then /^I will see confirmation$/ do
  pending # express the regexp above with the code you wish you had
end
