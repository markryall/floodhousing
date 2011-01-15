class SeekersController < ApplicationController
  def create
    accommodation = Accommodation.find(params[:accommodation])
    NotificationMailer.register_interest(accommodation, Seeker.new(params[:seeker])).deliver

    respond_to do |format|
      format.html { redirect_to :action => 'interest_registered' }
      format.xml { head :ok }
    end
  end
  
  def interest_registered
    respond_to do |format|
      format.html
      format.xml
    end
  end
  
end