class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :redirect_to_ssl
  
  def redirect_to_ssl
      redirect_to url_for params.merge({:protocol => 'https://', :host => 'www.ozfloodhelp.org'}) unless (request.ssl? || request.host=='127.0.0.1' || request.host=='localhost')
  end
end
