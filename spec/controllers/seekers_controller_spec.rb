require 'spec_helper'

describe SeekersController do

  before(:each) do
    @accommodation = Accommodation.make
    Accommodation.stub(:find).and_return(@accommodation)
    # Not an active record, so machinist doesn't work :(
    @params = {
      :name => 'Sarah Smith',
      :phone => '07 3123 4567',
      :terms_and_conditions_accepted => '1'
    }
  end

  it "should update the contact count for a listing when a seeker contacts the host" do
    @seeker = Seeker.new(@params)
    expect {
      post :create, :seeker => @params, :accommodation => @accommodation.id
      @accommodation.reload
    }.to change { @accommodation.contact_count }.by(1)
  end
end
