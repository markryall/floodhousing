require "spec_helper"

describe NotificationMailer do
  describe "accommdation_listed" do
    let(:mail) { NotificationMailer.accommdation_listed }

    it "renders the headers" do
      mail.subject.should eq("Accommdation listed")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
