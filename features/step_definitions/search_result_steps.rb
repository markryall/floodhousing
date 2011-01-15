Then /^I will be advised that there are no available places$/ do
  on(SearchPage) do | page |
    page.should have_no_available_places_message
  end
end

Then /^I will see (\d+) listings$/ do |number_of_listings|
  on(SearchPage) do | page |
    page.listings.size.should == number_of_listings.to_i
  end
end

Then /^I will not see a pagination control$/ do
  on(SearchPage) do | page |
    page.pagination_control.should be_nil
  end
end

Then /^I will see a pagination control$/ do
  on(SearchPage) do | page |
    page.pagination_control.should_not be_nil
  end
end

Then /^I will see the listings in the following order$/ do |table|
  expected_order = table.raw.flatten
  
  actual_order = []
  on(SearchPage) do | page |
    page.listings.each do |listing|
      actual_order << listing.find(".address dd").text
    end
  end
  
  actual_order.should eql expected_order
end