Then /^I will be advised that there are no available places$/ do
  Then %{I should see "Sorry, we don't have any places available" within "search-results"}
end