require "spec_helper"

describe NotificationMailer do
  describe "accommodation_listed" do
    let(:mail) { NotificationMailer.accommodation_listed(Accommodation.new(:email => "to@example.org", :name => "fred")) }

    it "renders the headers" do
      # mail.subject.should eq("Your accommodation has been listed")
      # mail.to.should eq(["fred <to@example.org>"])
      # mail.from.should eq(["floodhousing@thoughtworks.com"])
    end

    it "renders the body" do
      # mail.body.encoded.should match("Hi")
    end
  end

end
