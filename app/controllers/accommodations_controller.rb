class AccommodationsController < ApplicationController
  before_filter :authorized?, :only => [:edit, :update, :list]

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
    @suburb = params[:suburb] || 'All'
    @number_of_beds = params[:number_of_beds]
    @pets = params[:pets] == 'yes'
    @smokers = params[:smokers] == 'yes'
    @children = params[:children] == 'yes'
    @family = params[:family] == 'yes'

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

    respond_to do |format|
      if @accommodation.save
        NotificationMailer.accommodation_listed(@accommodation).deliver
        format.html { redirect_to thank_you_path }
        format.xml  { render :xml => @accommodation, :status => :created, :location => @accommodation }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @accommodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @accommodation = Accommodation.find(params[:id])

    respond_to do |format|
      if @accommodation.update_attributes(params[:accommodation])
	format.html { render :action => :edit }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @accommodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  def login
    @accommodation = Accommodation.find(params[:id])

    if @accommodation && @accommodation.authorization_token == params[:token]
      session[:ok_to_edit] = @accommodation.id.to_s
      redirect_to :action => :edit
    else
      redirect_to :root
    end
  end

  def list
    @accommodation = Accommodation.find(params[:id])
    @accommodation.update_attribute(:available, params[:available])

    respond_to do |format|
      format.js do
	render(:update) do |page|
	  page.replace 'availability', :partial => 'availability'
	end
      end
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
    session[:ok_to_edit] == params[:id] || authenticate_login!
  end

end
