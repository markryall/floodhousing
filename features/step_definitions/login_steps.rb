Given /^there is an Admin user$/ do |table|
  account = table.hashes.first
  Login.create! :email => account['email'], :password => account['password'], :password_confirmation => account['password']
end

When /^I log in as$/ do |table|
  account = table.hashes.first
  on_login do |page|
    page.login account['email'], account['password']
  end
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
