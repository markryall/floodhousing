Given /^there is an Admin user$/ do |table|
  table.hashes.each do |account|
    Login.create! :email => account['email'], :password => account['password'], :password_confirmation => account['password']
  end
end

When /^I log in as$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then /^the application will show that I am logged in as 'admin'$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I will asked to try again$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the application will show that I am not logged in$/ do
  pending # express the regexp above with the code you wish you had
end
