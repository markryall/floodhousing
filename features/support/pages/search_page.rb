require File.dirname(__FILE__) + "/page"
class SearchPage < Page

  def visit
     driver.visit '/accommodations/search'
  end
  
  def has_no_available_places_message?
    driver.has_css?("#no-listings-message")
  end
  
end