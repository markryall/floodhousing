@wip
Feature: Create listing
 In order to be able to help out ppl who have lost their homes (seekers) in the floods
 As a host
 I want to create a listing
 
 Scenario: Successful listing by filling in all fields
     
     When I fill in details about the accommodation I can offer
       |address1| christie centre |
       |address2| 320 adelaide st |
       |suburb| city | 
       |name| shandra | 
       |phone_mobile| 0421 334 343 |
        |phone_home| 9343 4543 |
       |email| foo@foo.com |
       |email_confirmation| foo@foo.com |
       |comments| hi |
       |number_of_beds| 4 |
      |takes_pets| yes | 
      |takes_children| yes | 
      |over_eighteen| yes |
      |takes_smokers| yes| 
       |takes_pets_comment| dogs |
      |takes_disabled| yes |
      |takes_storage| yes|
       |takes_storage_comment| cellar|
       |postcode|4000|
        | state | QLD|
       |area| North East Brisbane |
      |terms_and_conditions_accepted| yes|

     Then I will see confirmation
