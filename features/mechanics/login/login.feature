@wip
Feature: Login
  In order to be able to administer the system
  As a call centre operator
  I want to login to the system with full privelidges

  Scenario: Successful login
      Given there is an Admin user
         | username | password |
         | admin    | secret!  |      
      When I log in as
         | username | password |
         | admin    | secret!  |
      Then the application will show that I am logged in as 'admin'
  
  Scenario: Incorrect Password
      Given there is an Admin user
         | username | password |
         | admin    | secret!  |      
      When I log in as
         | username | password |
         | admin    | wrong!!  |
      Then I will asked to try again
      And the application will show that I am not logged in
               
  Scenario: Unknown User
      Given there is an Admin user
         | username | password |
         | admin    | secret!  |      
      When I log in as
         | username | password |
         | user     | password |
      Then I will asked to try again
      And the application will show that I am not logged in
   
  