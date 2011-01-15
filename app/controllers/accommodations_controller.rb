class AccommodationsController < ApplicationController
  before_filter :authenticate_login!, :only => [:edit, :update, :taken, :destroy]

  # GET /accommodations
  # GET /accommodations.xml
  def index
    redirect_to :action => 'search'
  end

  # GET /accommodations/1
  # GET /accommodations/1.xml
  def show
    @accommodation = Accommodation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accommodation }
    end
  end
  
  # GET /accommodations/search
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

  # GET /accommodations/new
  # GET /accommodations/new.xml
  def new
    @accommodation = Accommodation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accommodation }
    end
  end

  # GET /accommodations/1/edit
  def edit
    @accommodation = Accommodation.find(params[:id]) 
  end

  # POST /accommodations
  # POST /accommodations.xml
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

  # PUT /accommodations/1
  # PUT /accommodations/1.xml
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
  
  def taken
    @accommodation = Accommodation.find(params[:id])
    @accommodation.taken
    redirect_to :action => 'search'
  end

  # DELETE /accommodations/1
  # DELETE /accommodations/1.xml
  def destroy
    @accommodation = Accommodation.find(params[:id])
    @accommodation.destroy
  
    respond_to do |format|
      format.html { redirect_to(accommodations_url) }
      format.xml  { head :ok }
    end
  end
end
