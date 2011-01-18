class ApplicationController < ActionController::Base
  protect_from_forgery
  
  CANONICAL_HOST = 'www.ozfloodhelp.org'
  
  before_filter :redirect_to_ssl
  
  def redirect_to_ssl
    return unless Rails.env.production?
    return if request.host == CANONICAL_HOST
    redirect_to url_for params.merge({:host => CANONICAL_HOST})
  end
end