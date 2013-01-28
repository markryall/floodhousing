require File.dirname(__FILE__) + "/page"
class EditListingPage < Page
    
   def check_we_are_on_this_page 
     raise "Expected to be on the edit page, but was not" unless driver.has_css?("h2",:text => "Your accommodation details")  
   end
   
   def address_1
     driver.find("form #accommodation_address1").value
   end
   
end
