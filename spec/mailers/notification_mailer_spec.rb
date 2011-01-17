require "spec_helper"

describe NotificationMailer do
  describe "accommodation_listed" do
    
    before do
      #TODO - isolate this better so we dont have to care about id and authorization_token
      accomodation = stub("accommodation",{:email => "to@example.org", :name => "fred", :id => 1, :authorization_token => "xxxx"})
      @mail = NotificationMailer.accommodation_listed(accomodation)
    end
    
    it "renders the headers" do
      @mail.subject.should eq("[OzFloodHelp] Fred, your accommodation has been listed.")
      @mail.to.should eq(["to@example.org"])
      @mail.from.should eq(["info@getup.org.au"])
    end

    it "renders the body" do
      @mail.body.should match("Dear Fred,")
    end
  end

  describe "accom list but no name" do

    before do
      #TODO - isolate this better so we dont have to care about id and authorization_token
      accomodation = stub("accommodation",{:email => "to@example.org", :name => "", :id => 1, :authorization_token => "xxxx"})
      @mail = NotificationMailer.accommodation_listed(accomodation)
    end

    it "no name given" do
      @mail.body.should_not match("Dear")
    end
  end

end
