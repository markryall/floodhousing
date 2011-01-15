require 'spec_helper'

describe 'accommodations/search.html.erb' do
  include Devise::TestHelpers
  
  before(:each) do
    @user = Login.make
    Accommodation.make
    assign(:accommodations, Accommodation.search(AccommodationSearchQuery.new({}), 1))
  end
  
  it "should include a listing" do
    render
    rendered.should have_selector 'ul.listing li'
  end 

  describe 'with a logged in user' do
    
    before(:each) do
      sign_in @user
    end
    
    it "should include the Taken button" do
      render
      rendered.should have_selector 'input[value="Taken"]'
    end
  end
  
  describe 'without a logged in user' do
    
    it "should not include the Taken button" do
      render
      rendered.should_not have_selector 'input[value="Taken"]'
    end

  end

end