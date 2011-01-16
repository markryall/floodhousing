Feature: Billet Volunteering
  In order to register availability of my house for billeting
  As a resident of a non-effected house
  I can enter my property and contact details on the GetUp! Volunteering site

Scenario: Complete form with full details
  Given I am on the Queensland flood relief billet volunteering page
  When I complete the form with full details
  And I submit the page
  Then I should be given a confirmation that my details were accepted
