require 'spec_helper'

describe AccommodationsController do
  include Devise::TestHelpers

  before :each do
    @accommodation = Accommodation.make!
    Accommodation.stub(:find).and_return @accommodation
  end

  describe :index do
    it "should redirect to search" do
      get :index
      response.should redirect_to :action => :search
    end
  end

  describe :create do
    before :each do
      Accommodation.stub(:new).and_return(@accommodation)
    end

    it 'should initially set to unavailable' do
      @accommodation.should_receive(:available=).with(false)
      post :create, :accommodation => {}
    end

    it 'should initially set to disabled' do
      @accommodation.should_receive(:enabled=).with(false)
      post :create, :accommodation => {}
    end

    context "on success" do
      it "should redirect to thank you" do
        post :create, :accommodation => {}

        response.should redirect_to thank_you_path
      end
    end
  end

  describe :search do
    before :each do
      Accommodation.stub(:search).and_return([mock(Accommodation)])
    end

    it "should render search" do
      get :search, :area => 'Ipswich'

      response.should render_template :search
    end
  end

  describe :confirm_my_listing do
    context 'with a valid accommodation' do
      it 'should confirm the listing as available and redirect to edit page' do
        @accommodation.should_receive(:authorization_token).and_return "abc123"
        get :confirm_my_listing, :id => @accommodation.id, :token => "abc123"
        response.should redirect_to :action => :edit, :confirmed => true, :event => "offer confirmation"  
        session[:ok_to_edit].should == @accommodation.id.to_s
      end

      it 'should include event reflecting reminder email if query parameter from reminder email is set' do
        @accommodation.should_receive(:authorization_token).and_return "abc123"
        get :confirm_my_listing, :id => @accommodation.id, :token => "abc123", :reminder => true
        response.should redirect_to :action => :edit, :confirmed => true, :event => "offer confirmation via reminder"  
        session[:ok_to_edit].should == @accommodation.id.to_s
      end

      it 'should redirect an invalid token to the index page' do
        @accommodation.should_receive(:authorization_token).and_return nil
        get :confirm_my_listing, :id => @accommodation.id, :token => 'abc123'

        response.should redirect_to :root
        session[:ok_to_edit].should == nil
      end

    end

    it 'should redirect an invalid ID to the index page' do
      Accommodation.should_receive(:find).with('0').and_return nil
      get :confirm_my_listing, id: '0'
      response.should redirect_to :root
      session[:ok_to_edit].should == nil
    end
  end

  def self.it_should_reject_unauthorized(action, verb)
    context 'without session authorization' do
      it 'should reject an authenticated request' do
        send verb, action, :id => 1
        response.should redirect_to new_login_session_url
      end
    end
  end

  describe :edit do
    it_should_reject_unauthorized :edit, :get

    context 'with session authorization' do
      before :each do
        session[:ok_to_edit] = @accommodation.id
      end

      it 'should accept an authenticated request' do
        get :edit, :id => @accommodation.id
        response.should be_success
      end

      it 'should reject edit to unauthorized accomodation' do
        some_other_id = @accommodation.id * 10
        get :edit, :id => some_other_id
        response.should redirect_to new_login_session_url
      end

    end
  end

  describe :update do
    it_should_reject_unauthorized :update, :post

    context 'with session authorization' do
      before :each do
        @accommodation.stub(:update_attributes)
        session[:ok_to_edit] = @accommodation.id
      end

      it 'should change to enabled' do
        @accommodation.should_receive(:enabled=).with(true)
        post :update, id: @accommodation.id
      end

      it 'should accept an authenticated request' do
        post :update, id: @accommodation.id
        response.should be_success
      end

      it 'should update the model with changes' do
        params = {'lol' => '1'}
        @accommodation.should_receive(:update_attributes).with(params)
        post :update, id: @accommodation.id, accommodation: params
      end

      it 'should flash a notice' do
        @accommodation.stub(:update_attributes).and_return(true)
        post :update, id: @accommodation.id, accommodation: {}
        flash[:notice].should_not be_blank
      end
    end
  end

  describe :list do
    it_should_reject_unauthorized :list, :post

    context 'with session authorization' do
      before :each do
        @accommodation.stub :update_attribute
        session[:ok_to_edit] = @accommodation.id
      end

      it 'should accept an authenticated request' do
        xhr :put, :list, id: @accommodation.id, available: true
        response.should be_success
      end
    end

    context 'with a logged in user' do
      before :each do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in Login.make!
      end

      it "should allow a listing to be marked taken" do
        @accommodation.should_receive(:update_attribute).with(:available, false)
        xhr :put, :list, id: @accommodation.id, available: false
        response.should be_success
      end

      it "should render the availability partial" do
      	xhr :put, :list, id: @accommodation.id, available: true
      	response.should render_template('accommodations/_availability')
      end
    end
  end
end
