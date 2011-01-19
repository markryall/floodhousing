class SeekersController < ApplicationController
  def create
    @accommodation = Accommodation.find(params[:accommodation])
    @seeker = Seeker.new(params[:seeker])
    if @seeker.valid?
      email_notification @accommodation, @seeker
      Accommodation.transaction do
        @accommodation.reload
        @accommodation.update_attributes!(:contact_count => @accommodation.contact_count + 1)
      end
    end

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
private
  def email_notification accommodation, seeker
    begin
      NotificationMailer.register_interest(accommodation, seeker).deliver
    rescue Exception => e
      Rails.logger.error e
    end
  end
end
