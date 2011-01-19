require 'spec_helper'

describe Accommodation do

  it 'should not accept an invaild email' do
    accommodation = Accommodation.make
    accommodation.email = "test@test"
    accommodation.should_not be_valid
  end
   
  it 'should accept a vaild email' do
    accommodation = Accommodation.make
    accommodation.email = "test@test.com"
    accommodation.should be_valid
  end
  
  it 'should not accept an invalid phone number' do
    accommodation = Accommodation.make
    accommodation.phone_home = "12345"
    accommodation.should_not be_valid
  end
    
  it 'should not accept characters as a phone number' do
    accommodation = Accommodation.make
    accommodation.phone_home = "ab cdef ghij"
    accommodation.should_not be_valid
  end
   
  it 'should accept empty phone numbers' do
    accommodation = Accommodation.make
    accommodation.phone_home = ""
    accommodation.phone_mobile = ""
    accommodation.other_phone = ""
    accommodation.should be_valid
  end
   
  it 'should accept a valid phone number' do
    accommodation = Accommodation.make
    accommodation.phone_home = "9343 4543"
    accommodation.phone_mobile = "0421 334 343"
    accommodation.other_phone = "13-1800"
    accommodation.should be_valid
  end
  
  it 'should accept a valid postcode' do
    accommodation = Accommodation.make
    accommodation.postcode = "4000"
    accommodation.should be_valid
  end
     
  it 'should not accept an invalid postcode' do
    accommodation = Accommodation.make
    accommodation.postcode = "asd"
    accommodation.should_not be_valid
  end

  it 'should update the contact count' do
    accommodation = Accommodation.make
    expect {
      accommodation.record_contact
    }.to change { accommodation.contact_count }.by(1)
  end
    
  describe 'complete_address' do
    it 'should have address1, address2, suburb as comma separated fields' do
      accommodation = Accommodation.new
      accommodation.address1 = "one"
      accommodation.address2 = "two"
      accommodation.suburb = "suburb"
      accommodation.complete_address.should eql "one, two, suburb"
    end
  end
  describe 'restricted_address' do
    it 'should have suburb, postcode, area as comma separated fields' do
      accommodation = Accommodation.new
      accommodation.suburb = "suburb"
      accommodation.postcode = '9805'
      accommodation.area = 'area'
      accommodation.restricted_address.should eql "suburb, 9805, area"
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
