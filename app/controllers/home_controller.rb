class HomeController < ApplicationController
  def index
  end
  
  def faq
    respond_to do |format|
      format.html # faq.html.erb
    end 
  end
  
  def guidelines
    respond_to do |format|
      format.html # guidelines.html.erb
    end 
  end

end
