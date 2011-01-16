@wip
Feature: Create listing
  In order to be able to help out ppl who have lost their homes (seekers) in the floods
  As a host
  I want to create a listing

  Scenario: Successful login
      Given I have chosen to host a seeker
      When I fill in details about theaccommodation I can offer
         | num_beds     | 2 |
         | pets 	| yes  |
         | pets_desc 	| dog  |
         | children_friendly| yes  |
         | smokers_friendly| yes  |
         | disabled_friendly| yes  |
         | storage_available | yes  |
         | storage_desc | yes  |
      Then the application will show that I am logged in as 'admin'

  Scenario: Required fields missing
	Gvien bla		
     	Then bla
