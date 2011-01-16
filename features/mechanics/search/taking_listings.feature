Feature: Take Listings
  In order to be able to manage listings of accommodations
  As a call centre admin or a volunteer
  I want to be able to mark listings as taken
  
  
Scenario: As a call centre admin I want to be able to mark a listing as taken
  Given that a listing has been posted
  And I am logged in as an admin
  When I view the search page
  And I press "Taken"
  Then I should be on the search accommodations page
  And I will be advised that there are no available places
  
Scenario: When not logged in, there should be no taken button
  Given that a listing has been posted
  But no one is logged in
  When I view the search page
  Then I should not see "Taken" within "ul.listing"