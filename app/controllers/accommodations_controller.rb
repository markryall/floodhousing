class AccommodationsController < ApplicationController
  before_filter :authorized?, :only => [:edit, :update, :list, :unconfirmed]

  def index
    redirect_to :action => :search
  end

  def show
    @accommodation = Accommodation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accommodation }
    end
  end

  def search
    page = params[:page] || 1
    params[:available] ||= 'yes'
    params[:enabled] ||= true

    @accommodations = Accommodation.search(AccommodationSearchQuery.new(params), page)
    @area = params[:area] || 'All'
    @number_of_beds = params[:number_of_beds]
    @pets = params[:pets] == 'yes'
    @smokers = params[:smokers] == 'yes'
    @children = params[:children] == 'yes'
    @family = params[:family] == 'yes'
    @disabled = params[:disabled] == 'yes'
    @storage = params[:storage] == 'yes'

    respond_to do |format|
      format.html
      format.xml  { render :xml => @accommodations }
    end
  end

  def new
    @accommodation = Accommodation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accommodation }
    end
  end

  def edit
    @accommodation = Accommodation.find(params[:id])
    @accommodation.email_confirmation = @accommodation.email
  end

  def create
    @accommodation = Accommodation.new(params[:accommodation])
    @accommodation.available = false
    @accommodation.enabled = false

    respond_to do |format|
      if @accommodation.save
        email_notification(@accommodation)
        format.html { redirect_to thank_you_path }
        format.xml  { render :xml => @accommodation, :status => :created, :location => @accommodation }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @accommodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  def email_notification(accommodation)
    begin
      NotificationMailer.accommodation_listed(@accommodation).deliver
    rescue Exception => e
      Rails.logger.error e
    end
  end

  def update
    @accommodation = Accommodation.find(params[:id])
    @accommodation.enabled = true

    respond_to do |format|
      if @accommodation.update_attributes(params[:accommodation])
        format.html do
          flash[:notice] = "Thanks for that! We've saved your new details."
          redirect_to :action => :edit
        end
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @accommodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  def confirm_my_listing
    @accommodation = Accommodation.find(params[:id])

    if @accommodation && @accommodation.authorization_token == params[:token]
      session[:ok_to_edit] = @accommodation.id.to_s
      @accommodation.available = true
      @accommodation.enabled = true
      @accommodation.save
      event = "offer confirmation"
      event = "offer confirmation via reminder" if params[:reminder]
      redirect_to :action => :edit, :confirmed => true, :event => event
    else
      redirect_to :root
    end
  end

  def unconfirmed
    ids = params[:ids]
    if ids
      Accommodation.confirm(ids)
      redirect_to :action => :unconfirmed
    else
      @accommodations = Accommodation.find_unconfirmed
      respond_to do |format|
        format.html
      end
    end
  end

  def list
    @accommodation = Accommodation.find params[:id]
    @accommodation.update_attribute(:available, params[:available])

    respond_to do |format|
      format.js { render partial: 'availability' }
    end
  end

  def contact_host
    @seeker = Seeker.new
    @accommodation = Accommodation.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @seeker }
    end
  end

private
  def authorized?
    (session[:ok_to_edit]!=nil && session[:ok_to_edit].to_s == params[:id]) || authenticate_login!
  end
end
