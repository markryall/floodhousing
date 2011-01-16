Feature: Filter Listings
  In order to find relevant listings  
  As a Seeker
  I want to filter the listings on the search page
  
Scenario: Filter by number of beds
  Given a listing "listing with 2 beds" for 2 beds was posted
  And I view the search page
  When I filter by 2 beds
  Then the listing "listing with 2 beds" will be returned 
