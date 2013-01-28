Feature: Filter Listings
  In order to find relevant listings  
  As a Seeker
  I want to filter the listings on the search page

@javascript  
Scenario: Filter by number of beds
  Given a listing for 2 beds in "Ipswich" was posted
  And a listing for 1 beds in "Melbourne" was posted  
  And I view the search page
  When I filter by 2 beds
  Then only a listing for 2 beds in "Ipswich" will be returned

@javascript  
Scenario: Filter by area
  Given a listing for 2 beds in "Ipswich" was posted
  And a listing for 1 beds in "Melbourne" was posted  
  And I view the search page
  When I filter by area "Melbourne"
  Then only a listing for 1 beds in "Melbourne" will be returned
