class ApplicationController < ActionController::Base
  protect_from_forgery
  
  CANONICAL_HOST = ENV['CANONICAL_HOST']
  
  before_filter :redirect_to_ssl
  
  def redirect_to_ssl
    return unless ENV['USE_SSL'] == "true"
    return if request.ssl? && request.host == CANONICAL_HOST 
    redirect_to url_for params.merge({:protocol => 'https://', :host => CANONICAL_HOST})
  end
end