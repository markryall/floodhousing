require 'spec_helper'

describe AccommodationsController do
  include Devise::TestHelpers

  before :each do
    @accommodation = Accommodation.make
    Accommodation.stub(:find).and_return(@accommodation)
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

  describe :login do
    context 'with a valid accommodation' do
      it 'should redirect a valid token to the edit page' do
        token = 'abc123'

        @accommodation.should_receive(:authorization_token).and_return token
        get :login, :id => @accommodation.id, :token => token

        response.should redirect_to :action => :edit
        session[:ok_to_edit].should == @accommodation.id.to_s
      end

      it 'should redirect an invalid token to the index page' do
        @accommodation.should_receive(:authorization_token).and_return nil
        get :login, :id => @accommodation.id, :token => 'abc123'

        response.should redirect_to :root
        session[:ok_to_edit].should == nil
      end

    end

    it 'should redirect an invalid ID to the index page' do
      Accommodation.should_receive(:find).with(0).and_return nil
      get :login, :id => 0

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

      it 'should accept an authenticated request' do
        post :update, :id => @accommodation.id
        response.should be_success
      end

      it 'should reject edit to unauthorized accomodation' do
        some_other_id = @accommodation.id * 10
        post :update, :id => some_other_id
        response.should redirect_to new_login_session_url
      end
    end
  end

  describe :taken do
    it_should_reject_unauthorized :taken, :post

    context 'with session authorization' do
      before :each do
        @accommodation.stub(:update_attribute)
        session[:ok_to_edit] = @accommodation.id
      end

      it 'should accept an authenticated request' do
        post :taken, :id => @accommodation.id
        response.should redirect_to :action => :search
      end

    end

    context "with a logged in user" do
      before :each do
        @user = Login.make
        sign_in @user
      end

      it "should allow a listing to be marked taken" do
        @accommodation.should_receive(:update_attribute).with(:available, false)
        post :taken, :id => @accommodation.id
        response.should be_redirect
      end
    end
  end

  describe :delist do
    it_should_reject_unauthorized :delist, :post

    context 'with session authorization' do
      before :each do
        @accommodation.stub(:update_attribute)
        session[:ok_to_edit] = @accommodation.id
      end

      it 'should accept an authenticated request' do
        post :delist, :id => @accommodation.id
        response.should redirect_to :action => :search
      end

    end

    context "with a logged in user" do
      before :each do
        @user = Login.make
        sign_in @user
      end

      it "should allow a listing to be delisted" do
        @accommodation.should_receive(:update_attribute).with(:enabled, false)
        post :delist, :id => @accommodation.id
        response.should be_redirect
      end
    end
  end
end
