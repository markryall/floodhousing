class AccommodationsController < ApplicationController
  before_filter :authorized?, :only => [:edit, :update, :taken]

  def index
    redirect_to :action => 'search'
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
        format.html { redirect_to(:action => 'search') }
        format.xml  { render :xml => @accommodation, :status => :created, :location => @accommodation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @accommodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @accommodation = Accommodation.find(params[:id])

    respond_to do |format|
      if @accommodation.update_attributes(params[:accommodation])
        format.html { redirect_to(:action => 'search') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
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

  def taken
    @accommodation = Accommodation.find(params[:id])
    @accommodation.update_attribute(:available, false)

    respond_to do |format|
      format.html { redirect_to :action => 'search' }
      format.xml { head :ok }
    end
  end

  private
  def authorized?
    session[:ok_to_edit] == params[:id] || authenticate_login!
  end

end
