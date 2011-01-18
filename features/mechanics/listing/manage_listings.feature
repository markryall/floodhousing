Feature: Manage Listings
  In order to be able to allocate beds to seekers
  As a call centre admin or a volunteer
  I need to be able to perform a variety of management tasks

  @javascript
  Scenario: As a call centre admin I want to delist an accommodation
    Given that a listing has been posted
    And I am logged in as an admin

    When I view the search page
    And I press "Edit"
    And I follow "Remove my offer from the website, please."

    When I view the search page
    Then I will be advised that there are no available places

  Scenario: As a call centre admin, I should be able to edit a listing
    Given that a listing has been posted
    And I am logged in as an admin

    When I view the search page
    And I press "Edit"
    And I select "7+" from "Number of beds"
    And I press "Update Accommodation"

    When I view the search page
    Then I should see "7+" within "dt.number-of-beds + dd"

  Scenario: When not logged in, there should be no edit button
    Given that a listing has been posted
    But no one is logged in
    When I view the search page
    Then I should not see "Edit" within "ul.listing"
