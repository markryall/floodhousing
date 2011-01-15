require File.dirname(__FILE__) + "/page"
class SearchPage < Page

  def visit
     driver.visit '/'
  end
  
end