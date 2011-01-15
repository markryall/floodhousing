@wip
Feature: View Latest Listings
  In order to see what kind of thing is available on this site
  As a Seeker
  I want to be able to see the latest listings on the search page
  
  
Scenario: There are no listings yet
    Given that no listings have been posted 
    When I view the search page
    Then I will be advised that there are no available places
    
Scenario: There are no available listings
    Given that a listing has been posted
    But that listing has already been taken
    When I view the search page
    Then I will be advised that there are no available places

# Scenario: There is less than one page of available listings
# 
# Scenario: There is exactly on page of available listings
# 
# Scenario: There is more than one page of available listings
# 
# Scenario: Most recent listings are shown first