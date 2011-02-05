require 'spec_helper'

describe ApplicationController do
  before do
    @controller = ApplicationController.new
    @request = stub('request')
    @url = stub('url')
    @params = {}
    @controller.stub! :redirect_to
    @controller.stub!(:url_for).and_return(@url)
    @controller.stub!(:params).and_return(@params)
    @controller.stub!(:request).and_return(@request)
  end

  def with_environment hash
    hash.each_pair { |key, value| ENV.should_receive(:[]).with(key).and_return value }
  end

  def with_request hash
    hash.each_pair { |key, value| @request.should_receive(key).and_return value }
  end

  def should_not_redirect
    @controller.should_not_receive :redirect_to
  end

  def should_redirect_with hash
    @controller.should_receive(:url_for).with hash
    @controller.should_receive(:redirect_to).with @url
  end

  describe '#redirect_to_ssl' do
    after do
      @controller.redirect_to_ssl
    end

    it 'should skip redirection when DISABLE_REDIRECTS is set to true' do
      with_environment 'DISABLE_REDIRECTS' => 'true'
      should_not_redirect
    end

    it 'should skip redirection when request is already to CANONICAL_HOST, the request is ssl, and USE_SSL is set and DISABLE_REDIRECTS is unset' do
      with_environment 'DISABLE_REDIRECTS' => nil, 'CANONICAL_HOST' => 'www.host.com', 'USE_SSL' => 'true'
      with_request :host => 'www.host.com', :ssl? => true
      should_not_redirect
    end

    it 'should redirect to CANONICAL_HOST when DISABLE_REDIRECTS and USE_SSL is unset' do
      with_environment 'DISABLE_REDIRECTS' => nil, 'CANONICAL_HOST' => 'www.host.com', 'USE_SSL' => nil
      with_request :host => 'something.heroku.com', :ssl? => false, :protocol => 'protocol://'
      should_redirect_with  :protocol => 'protocol://', :host => 'www.host.com'
    end

    it 'should redirect to CANONICAL_HOST and change protocol when USE_SSL is true and DISABLE_REDIRECTS is unset' do
      with_environment 'DISABLE_REDIRECTS' => nil, 'CANONICAL_HOST' => 'www.host.com', 'USE_SSL' => 'true'
      with_request :ssl? => false
      should_redirect_with :protocol => 'https://', :host => 'www.host.com'
    end
  end
end