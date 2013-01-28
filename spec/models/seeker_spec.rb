require 'spec_helper'

describe Seeker do
  def valid_seeker_with params={}
    Seeker.new({
      :terms_and_conditions_accepted => '1',
      :name => 'Sarah Smith',
      :phone => '07 3123 4567'
    }.merge params)
  end

  it 'should be valid' do
    valid_seeker_with({}).should be_valid
  end

  [:name, :phone].each do |field|
    it "should be invalid without #{field}" do
      seeker = valid_seeker_with field => nil
      seeker.should_not be_valid
      seeker.errors[field].should == ["can't be blank"]
    end
  end

  it 'should be invalid without terms and conditions' do
    seeker = valid_seeker_with :terms_and_conditions_accepted => false
    seeker.should_not be_valid
    seeker.errors[:terms_and_conditions_accepted].should == ["Please accept the terms and conditions"]
  end
end