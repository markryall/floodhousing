require File.dirname(__FILE__) + "/page"
class LoginPage < Page

  def visit
     driver.visit '/logins/sign_in'
  end
  
  def login email, password
    @driver.fill_in 'login_email', :with => email
    @driver.fill_in 'login_password', :with => password
    @driver.click_button 'login_submit'
  end
end