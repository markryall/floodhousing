require File.dirname(__FILE__) + "/page"
class CreateListingPage < Page

  def visit
     driver.visit '/accommodations/new'
  end

  def create_listing listing
    @driver.fill_in "accommodation_address1", :with => listing['address1']
    @driver.fill_in "accommodation_address2", :with => listing['address2']
    @driver.fill_in "accommodation_suburb", :with => listing['suburb']
    @driver.select listing["area"], :from => 'accommodation_area'
    @driver.fill_in "accommodation_name", :with => listing['name']
    @driver.fill_in "accommodation_phone_mobile", :with => listing['phone_mobile']
    @driver.fill_in "accommodation_phone_home", :with => listing['phone_home']
    @driver.fill_in "accommodation_other_phone", :with => listing['other_phone']
    @driver.fill_in "accommodation_email", :with => listing['email']
    @driver.fill_in "accommodation_email_confirmation", :with => listing['email_confirmation']
    @driver.fill_in "accommodation_comments", :with => listing['comments']
    @driver.select listing['number_of_beds'], :from => "accommodation_number_of_beds"
    @driver.check "accommodation_takes_pets" if listing['takes_pets']
    @driver.check "accommodation_takes_children" if listing['takes_children']
    @driver.check "accommodation_over_eighteen" if listing['over_eighteen']
    @driver.check "accommodation_takes_smokers" if listing['takes_smokers']
    @driver.fill_in "accommodation_takes_pets_comment", :with => listing['takes_pets_comment']
    @driver.check "accommodation_takes_disabled" if listing['takes_disabled']
    @driver.check "accommodation_takes_storage" if listing['takes_storage']
    @driver.fill_in "accommodation_takes_storage_comment", :with => listing['takes_storage_comment']
    @driver.fill_in "accommodation_postcode", :with => listing['postcode']
    @driver.check "accommodation_terms_and_conditions_accepted" if listing['terms_and_conditions_accepted']

    @driver.click_button 'accommodation_submit'
  end
end
