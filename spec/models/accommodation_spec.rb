require 'spec_helper'

describe Accommodation do
  
  describe 'complete_address' do
    it 'should have comma separated address fields' do
      accommodation = Accommodation.new
      accommodation.address1 = "one"
      accommodation.address2 = "two"
      accommodation.suburb = "suburb"
      accommodation.complete_address.should eql "one, two, suburb"
    end
  end

  describe :authorization_token do
    before :each do
      @accommodation = Accommodation.new
    end

    it 'should reply with a short string' do
      @accommodation.authorization_token.length.should == 25
    end

    it 'should be the same on each call' do
      @accommodation.authorization_token.should == @accommodation.authorization_token
    end
  end
end
