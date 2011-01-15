require 'spec_helper'

describe AccommodationsController do
  include Devise::TestHelpers
  
  before(:each) do
    @acc = Accommodation.create!(:over_eighteen => true, :number_of_beds => 4)
  end
  
  it "should redirect to search from the index" do
    get :index
    response.should be_redirect
    response.location.should == search_accommodations_url
  end
  
  describe "without a logged in user" do
    
    it "should redirect for a login when trying to mark a listing as taken" do
      put :taken, :id => @acc
      @acc.reload
      @acc.should be_available
      response.should be_redirect
    end
    
  end
  
  describe "with a logged in user" do
    
    before(:all) do
      @user = Login.create!(:email => 'foo@bacon.org', :password => 'password', :password_confirmation => 'password')
    end
    
    before(:each) do
      sign_in @user
    end
    
    it "should allow a listing to be marked taken" do
      put :taken, :id => @acc
      @acc.reload
      @acc.should_not be_available
      response.should be_redirect
    end
    
  end
  

end