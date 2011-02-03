class ApplicationController < ActionController::Base
  protect_from_forgery
  
  CANONICAL_HOST = ENV['CANONICAL_HOST'] || 'www.ozdisasterhelp.org'
  
  before_filter :redirect_to_ssl
  
  def redirect_to_ssl
    return if ENV['DISABLE_REDIRECTS'] == 'true'
    wants_ssl = (ENV['USE_SSL'] == 'true')
    return if (request.ssl? || !wants_ssl) && request.host == CANONICAL_HOST
    redir_scheme = wants_ssl ? "https://" : request.protocol
    redirect_to url_for params.merge({:protocol => redir_scheme, :host => CANONICAL_HOST})
  end
end
