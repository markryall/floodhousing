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
  
end