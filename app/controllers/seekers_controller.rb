class SeekersController < ApplicationController
  def create
    @accommodation = Accommodation.find(params[:accommodation])
    @seeker = Seeker.new(params[:seeker])
    NotificationMailer.register_interest(@accommodation, @seeker).deliver if @seeker.valid?
    
    respond_to do |format|
      if @seeker.valid?
        format.html { redirect_to :action => 'interest_registered' }
        format.xml { head :ok }
      else
        format.html { render :action => "accommodations/contact_host" }
        format.xml  { render :xml => @seeker.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def interest_registered
    respond_to do |format|
      format.html
      format.xml
    end
  end
  
end