module ApplicationHelper
  def short_login_path(accommodation)
    url_for :controller => :accommodations, :action => :login, :id => accommodation.id, :token => accommodation.authorization_token
  end

  def short_login_url(accommodation)
    url_for :only_path => false, :controller => :accommodations, :action => :login, :id => accommodation.id, :token => accommodation.authorization_token
  end

  def display_flash_messages
    content_tag(:div, :id => :flash) do
      flash.map do |css_class, message|
        content_tag(:p, content_tag(:span, message), :class => css_class)
      end.sum
    end
  end
end
