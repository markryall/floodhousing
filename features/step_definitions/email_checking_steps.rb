Then /^I will receive a confirmation email at "([^\"]*)"$/ do |email_address|
  ActionMailer::Base.deliveries.should_not be_empty
  @last_email = ActionMailer::Base.deliveries.pop
  @last_email.to.should eql([email_address])
end

Then /^the subject will be "([^\"]*)"$/ do |subject|
  @last_email.subject.should eql(subject)
end

Then /^the email will address me as "([^"]*)"$/ do |name|
  (@last_email.text_part || @last_email.body).to_s.should =~ /#{name}/
end

Then /^the email will contain a link I should click if I need to update my listing$/ do
  (@last_email.text_part || @last_email.body).to_s =~ /http[s]?:\/\/\S+/
  @link = $&
  @link.should_not be_nil
end

When /^I visit the link$/ do
 visit @link
end
