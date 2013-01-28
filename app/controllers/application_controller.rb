class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect_to_ssl
  
  def redirect_to_ssl
    return if ENV['DISABLE_REDIRECTS'] == 'true'
    canonical_host = ENV['CANONICAL_HOST']
    return unless canonical_host
    wants_ssl = (ENV['USE_SSL'] == 'true')
    return if (request.ssl? || !wants_ssl) && request.host == canonical_host
    redir_scheme = wants_ssl ? "https://" : request.protocol
    redirect_to url_for params.merge({:protocol => redir_scheme, :host => canonical_host})
  end
end