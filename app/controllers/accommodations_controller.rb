class AccommodationsController < ApplicationController
  
  # GET /accommodations
  # GET /accommodations.xml
  def index
    @accommodations = Accommodation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accommodations }
    end
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
    @accommodations = Accommodation.all

    respond_to do |format|
      format.html # search.html.erb
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
  #def edit
  #  @accommodation = Accommodation.find(params[:id])
  #end

  # POST /accommodations
  # POST /accommodations.xml
  def create
    @accommodation = Accommodation.new(params[:accommodation])

    respond_to do |format|
      if @accommodation.save
        format.html { redirect_to(@accommodation, :notice => 'Accommodation was successfully created.') }
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
        format.html { redirect_to(@accommodation, :notice => 'Accommodation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @accommodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodations/1
  # DELETE /accommodations/1.xml
  #def destroy
  #  @accommodation = Accommodation.find(params[:id])
  #  @accommodation.destroy

  #  respond_to do |format|
  #    format.html { redirect_to(accommodations_url) }
  #    format.xml  { head :ok }
  #  end
  #end
end
