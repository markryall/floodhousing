Feature: Listing Created Email
 In order to be able to easily update my listing in the future
 As a host
 I want to receive a confirmation email with a link to my listing
 
 
 Scenario: Host will be sent email confirming their registration
  
    #TODO remove irrevelvant detail from this test
    When I fill in details about the accommodation I can offer
      | address1                      | ThoughtWorks office |
      | address2                      | 1 Queen st          |
      | suburb                        | city                |
      | name                          | shandra             |
      | phone_mobile                  | 0421 334 343        |
      | phone_home                    | 9343 4543           |
      | email                         | foo@foo.com         |
      | email_confirmation            | foo@foo.com         |
      | comments                      | hi                  |
      | number_of_beds                | 4                   |
      | takes_pets                    | yes                 |
      | takes_children                | yes                 |
      | over_eighteen                 | yes                 |
      | takes_smokers                 | yes                 |
      | takes_pets_comment            | dogs                |
      | takes_disabled                | yes                 |
      | takes_storage                 | yes                 |
      | takes_storage_comment         | cellar              |
      | postcode                      | 4000                |
      | area                          | Brisbane North-East |
      | terms_and_conditions_accepted | yes                 |
     
    Then I will receive a confirmation email at "foo@foo.com"
    And the subject will be "Your accommodation has been listed"
    And the email will address me as "shandra"
    And the email will contain a link I should click if I need to update my listing

    When I visit the link
    Then I will shown a form to update the listing at "ThoughtWorks office"
     
