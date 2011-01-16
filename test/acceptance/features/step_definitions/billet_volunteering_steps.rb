Given /^I am on the Queensland flood relief billet volunteering page$/ do
  @billet_volunteering_page = BilletVolunteering.new @browser
end

When /^I complete the form with (.+)$/ do |type_of_details|
  @billet_volunteering_page.complete_with type_of_details
end

When /^I submit the page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be given a confirmation that my details were accepted$/ do
  pending # express the regexp above with the code you wish you had
end