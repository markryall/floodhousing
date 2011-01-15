require 'spec_helper'

describe ApplicationHelper do
  describe :short_login_path do
    before :each do
      @acc = mock_model(Accommodation, :id => 1, :authorization_token => 'abc123')
    end

    it 'should generate a path with the authorization key' do
      short_login_path(@acc).should == "/l/#{@acc.id}/#{@acc.authorization_token}"
    end
  end

  describe :short_login_url do
    before :each do
      @acc = mock_model(Accommodation, :id => 1, :authorization_token => 'abc123')
      controller.default_url_options[:host] = "localhost"
    end

    it 'should generate a path with the authorization key' do
      short_login_url(@acc).should == "http://localhost/l/#{@acc.id}/#{@acc.authorization_token}"
    end
  end
end
