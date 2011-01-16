require File.dirname(__FILE__) + "/page"
class ThankYouPage < Page
  def check_we_are_on_this_page
    @driver.current_path.should =~ /.+thank_you\/?$/
  end
end
