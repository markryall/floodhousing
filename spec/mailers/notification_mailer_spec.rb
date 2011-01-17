require "spec_helper"

describe NotificationMailer do
  describe "accommodation_listed" do
    
    before do
      #TODO - isolate this better so we dont have to care about id and authorization_token
      accomodation = stub("accommodation",{:email => "to@example.org", :name => "fred", :id => 1, :authorization_token => "xxxx"})
      @mail = NotificationMailer.accommodation_listed(accomodation)
    end
    
    it "renders the headers" do
      @mail.subject.should eq("Your accommodation has been listed")
      @mail.to.should eq(["to@example.org"])
      @mail.from.should eq(["ozfloodhelp@getup.org.au"])
    end

    it "renders the body" do
      @mail.body.should match("fred")
    end
  end

end
