class LoginPage
  def self.on driver
    driver.visit '/logins/sign_in'
    yield LoginPage.new driver
  end

  def initialize driver
    @driver = driver
  end

  def login email, password
    @driver.fill_in 'login_email', :with => email
    @driver.fill_in 'login_password', :with => password
    @driver.click_button 'login_submit'
  end
end