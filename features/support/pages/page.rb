class Page
  
  attr_accessor :driver
  
  def initialize driver
    @driver = driver
  end
  
  def check_we_are_on_this_page
    #override this in your specific pages to check you are on the right one
  end
  
end