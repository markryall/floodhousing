module ApplicationHelper
  def short_confirmation_path(accommodation)
    url_for :controller => :accommodations, :action => :confirm_my_listing, :id => accommodation.id, :token => accommodation.authorization_token
  end

  def short_confirmation_url(accommodation, params={})
    stuff= {:only_path => false, :controller => :accommodations, :action => :confirm_my_listing, :id => accommodation.id, 
    :token => accommodation.authorization_token}
    stuff.update(params)
    url_for stuff
  end

  def display_flash_messages
    content_tag(:div, :id => :flash) do
      flash.map do |css_class, message|
        content_tag(:p, content_tag(:span, message), :class => css_class)
      end.sum
    end
  end
end
