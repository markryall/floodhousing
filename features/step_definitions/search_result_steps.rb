Then /^I will be advised that there are no available places$/ do
  on(SearchPage) do | page |
    page.should have_no_available_places_message
  end
end