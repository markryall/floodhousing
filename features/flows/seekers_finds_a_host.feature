Feature: Seekers can find hosts with matching accomodation
In order to find a place to live
A seeker
wants to ask appropriate hosts and ask them to contact the seeker

@wip @end_to_end @email @web
Scenario: Simple - seeker contacts host directly

Henry has a house available. He's happy to receive messages from seekers, but
doesn't want to make his last name public, nor his email address, phone
number, etc. He'd rather not receive too many phone calls and wants to decide
when he makes the phone calls.

Sue needs to find a place. Sue smokes and is used to smoking inside. She has
an 11-year old kid and a big dog. The kid is allergic to cats. She has a
couple of suitcases. She's using someone's computer and doesn't have an email address.


  When Henry Host posts a listing in postcode 4000 with the following details:
    | beds            | 3           |
    | available until | 2011-Jan-15 |
  Then Henry should receive a confirmation email from OzFloodHelp with a tracking code


  When Sue Seeker finds out about OzFloodHelp.org
  And Sue visits the the OzFloodHelp website
  Then she should see a notice board with some of the most recent listings

  When she refines the results notice board to listings like the following:
    | number of beds required   | 2              |
    | kid-friendly?             | yes            |
    | pets-friendly?            | yes            |
    | in the area of            | North Brisbane |
    | disabled access required? | no preference  |
    # maybe postcode (proximity?)
  Then should see a notice board of listings including Henry's listing

  When Sue contacts the Henry with the following:
    | name                        | Sue Seeker            |
    | contact me by               | phone                 |
    | phone number                | 0404040404            |
    | number of people            | 2 (me and my kid)     |
    | allergies                   | cats                  |
    | special access requirements | none                  |
    | pets                        | a big lovely Alsatian |
    | personal message            | Hi, can you help?     |
  Then Henry should recieve an email from Sue (via OzFloodHelp) like the following:
    """
    Hi Henry,
    
    You have received a request for accommodation from Sue. Sue's details are
    below. Please make contact with her and let her know if you can help her out
    or not. Please don't select people who aren't a good match for you - refer
    to our guidelines for more advice on this. You may receive requests from
    other people too - please reply to all that you can to let them know whether
    you can help out. If you have filled your available beds, please click here
    to update your post on the ozfloodhelp website so that you don't receive
    more emails like this one! Thanks!
    
    Contact me by: phone
    Phone number: 0404040404
    number of people: 2 (me and my kid)
    allergies: cats
    special access requirements: none
    pets: a big lovely Alsatian
    personal message:  Hi, can you help?
    
    """
  But Sue shouldn't see Henry's address

  When Henry calls Sue and arranges for her to stay with him
  And Henry follows the "mark my listing as taken" link in his email from Sue
  And marks his listing as taken
  Then Henry's listing should no longer show up on the notice board
