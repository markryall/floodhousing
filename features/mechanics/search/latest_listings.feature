Feature: View Latest Listings
  In order to see what kind of thing is available on this site
  As a Seeker
  I want to be to see the latest listings on the search page by default
  
Scenario: There are no listings yet
  Given that no listings have been posted 
  When I view the search page
  Then I will be advised that there are no available places
    
Scenario: There are no available listings
  Given that a listing has been posted
  But that listing has already been taken
  When I view the search page
  Then I will be advised that there are no available places

Scenario: There is less than one page of available listings
  Given that 5 listings have been posted
  When I view the search page
  Then I will see 5 listings
  And I will not see a pagination control
 
Scenario: There is exactly one page of available listings
  Given that 50 listings have been posted
  When I view the search page
  Then I will see 50 listings
  And I will not see a pagination control
 
Scenario: There is more than one page of available listings
  Given that 55 listings have been posted
  When I view the search page
  Then I will see 50 listings
  And I will see a pagination control
  #TODO check pagination stuff

 
Scenario: Most recent listings are shown first
  Given a listing at "100, Order St, Brisbane" was posted today 
  And a listing at "300, Order St, Brisbane" was posted 2 days ago 
  And a listing at "200, Order St, Brisbane" was posted 1 day ago

  When I view the search page
  Then I will see the listings in the following order
    | Brisbane, 3184, Ipswich |
    | Brisbane, 3184, Ipswich |
    | Brisbane, 3184, Ipswich |
   
