module ApplicationHelper
  def short_login_path(accommodation)
    url_for :controller => :accommodations, :action => :login, :id => accommodation.id, :token => accommodation.authorization_token
  end

  def short_login_url(accommodation)
    url_for :only_path => false, :controller => :accommodations, :action => :login, :id => accommodation.id, :token => accommodation.authorization_token
  end
end
