class BilletVolunteering
  include WatirHelper

  URLS = {
    :local => "http://localhost/accommodations/new",
    :production => "http://floodhousing.heroku.com/accommodations/new"
  }


  text_field(:address1, :id => "accommodation_address1")
  text_field(:address2, :id => "accommodation_address2")
  text_field(:suburb, :id => "accommodation_suburb")
  text_field(:number_of_people, :id => "accommodation_number_of_people")
  checkbox(:takes_pets, :id => "accommodation_takes_pets")
  checkbox(:takes_family, :id => "accommodation_takes_family")
  checkbox(:takes_children, :id => "accommodation_takes_children")
  checkbox(:takes_smokers, :id => "accommodation_takes_smokers")
  checkbox(:takes_other, :id => "accommodation_takes_other_needs")
  text_field(:name, :id => "accommodation_name")
  text_field(:home_phone, :id => "accommodation_phone_home")
  text_field(:mobile_phone, :id => "accommodation_phone_mobile")
  text_field(:other_phone, :id => "accommodation_other_phone")
  text_field(:email, :id => "accommodation_email")
  text_field(:over18, :id => "accommodation_over_eighteen")
  text_field(:comments, :id => "accommodation_comments")
  button(:submit, :id =>"accommodation_submit")

  def initialize(browser)
    @browser = browser
    @browser.goto URLS[:production]
  end

  def complete_with type_of_details
    require "yaml"
    @details = YAML.load_file("#{TEST_DATA_DIR}/billet_volunteering_data.yml")[type_of_details]
    @details.each do |field, value|
      self.send("#{field}=", value)
    end
  end
end