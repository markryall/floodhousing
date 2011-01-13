class AccomodationsController < ApplicationController
  # GET /accomodations
  # GET /accomodations.xml
  def index
    @accomodations = Accomodation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accomodations }
    end
  end

  # GET /accomodations/1
  # GET /accomodations/1.xml
  def show
    @accomodation = Accomodation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accomodation }
    end
  end

  # GET /accomodations/new
  # GET /accomodations/new.xml
  def new
    @accomodation = Accomodation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accomodation }
    end
  end

  # GET /accomodations/1/edit
  def edit
    @accomodation = Accomodation.find(params[:id])
  end

  # POST /accomodations
  # POST /accomodations.xml
  def create
    @accomodation = Accomodation.new(params[:accomodation])

    respond_to do |format|
      if @accomodation.save
        format.html { redirect_to(@accomodation, :notice => 'Accomodation was successfully created.') }
        format.xml  { render :xml => @accomodation, :status => :created, :location => @accomodation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @accomodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accomodations/1
  # PUT /accomodations/1.xml
  def update
    @accomodation = Accomodation.find(params[:id])

    respond_to do |format|
      if @accomodation.update_attributes(params[:accomodation])
        format.html { redirect_to(@accomodation, :notice => 'Accomodation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @accomodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accomodations/1
  # DELETE /accomodations/1.xml
  def destroy
    @accomodation = Accomodation.find(params[:id])
    @accomodation.destroy

    respond_to do |format|
      format.html { redirect_to(accomodations_url) }
      format.xml  { head :ok }
    end
  end
end
