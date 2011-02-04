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

  it 'should skip redirection when DISABLE_REDIRECTS is set to true' do
    ENV.should_receive(:[]).with('DISABLE_REDIRECTS').and_return('true')
    @controller.should_not_receive(:redirect_to)
    @controller.redirect_to_ssl
  end

  it 'should skip redirection when request is already to CANONICAL_HOST, the request is ssl, and USE_SSL is set and DISABLE_REDIRECTS is unset' do
    ENV.should_receive(:[]).with('DISABLE_REDIRECTS').and_return(nil)
    ENV.should_receive(:[]).with('CANONICAL_HOST').and_return('www.host.com')
    ENV.should_receive(:[]).with('USE_SSL').and_return('true')

    @request.should_receive(:host).and_return('www.host.com')
    @request.should_receive(:ssl?).and_return(true)

    @controller.should_not_receive(:redirect_to)
    @controller.redirect_to_ssl
  end

  it 'should redirect to CANONICAL_HOST when DISABLE_REDIRECTS and USE_SSL is unset' do
    ENV.should_receive(:[]).with('DISABLE_REDIRECTS').and_return(nil)
    ENV.should_receive(:[]).with('CANONICAL_HOST').and_return('www.host.com')
    ENV.should_receive(:[]).with('USE_SSL').and_return(nil)

    @request.should_receive(:protocol).and_return('protocol://')
    @request.should_receive(:host).and_return('something.heroku.com')
    @request.should_receive(:ssl?).and_return(false)

    @controller.should_receive(:url_for).with({:protocol => 'protocol://', :host => 'www.host.com'})
    @controller.should_receive(:redirect_to).with(@url)
    @controller.redirect_to_ssl
  end

  it 'should redirect to CANONICAL_HOST and change protocol when USE_SSL is true and DISABLE_REDIRECTS is unset' do
    ENV.should_receive(:[]).with('DISABLE_REDIRECTS').and_return(nil)
    ENV.should_receive(:[]).with('CANONICAL_HOST').and_return('www.host.com')
    ENV.should_receive(:[]).with('USE_SSL').and_return('true')

    @request.should_receive(:ssl?).and_return(false)

    @controller.should_receive(:url_for).with({:protocol => 'https://', :host => 'www.host.com'})
    @controller.should_receive(:redirect_to).with(@url)
    @controller.redirect_to_ssl
  end
end