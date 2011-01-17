class HomeController < ApplicationController
  def index
  end
  
  def faq
    respond_to do |format|
      format.html # faq.html.erb
    end 
  end

end
