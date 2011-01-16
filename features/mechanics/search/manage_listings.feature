Feature: Manage Listings
  In order to be able to allocate beds to seekers
  As a call centre admin or a volunteer
  I need to be able to perform a variety of management tasks
    
Scenario: As a call centre admin I want to be able to mark a listing as taken
  Given that a listing has been posted
  And I am logged in as an admin
  When I view the search page
  And I press "Edit"
  And I press "Taken"
  Then I should be on the search accommodations page
  And I will be advised that there are no available places
  
Scenario: As a call centre admin, I should be able to edit a listing
  Given that a listing has been posted
  And I am logged in as an admin
  When I view the search page
  And I press "Edit"
  Then show me the page
  When I select "6+" from "Number of beds"
  And I press "Update Accommodation"
  Then I should be on the search accommodations page
  And I should see "6+" within "dt.number-of-people + dd"
  
Scenario: When not logged in, there should be no edit button
  Given that a listing has been posted
  But no one is logged in
  When I view the search page
  Then I should not see "Edit" within "ul.listing"
