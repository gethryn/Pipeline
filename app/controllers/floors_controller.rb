class FloorsController < ApplicationController
  # GET /floors
  # GET /floors.xml
  def index
    if params[:building_id].nil?
      @floors = Floor.all
    else
      @floors = Floor.find(:all, :conditions => { :building_id => params[:building_id] })
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @floors }
    end
  end

  # GET /floors/1
  # GET /floors/1.xml
  def show
    @floor = Floor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @floor }
    end
  end

  # GET /floors/new
  # GET /floors/new.xml
  def new
    if params[:building_id].nil?
      @floor = Floor.new
    else 
      @floor = Floor.new(:building_id => params[:building_id])
    end
    @buildings = Building.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @floor }
    end
  end

  # GET /floors/1/edit
  def edit
    @floor = Floor.find(params[:id])
    @buildings = Building.find(:all)
  end

  # POST /floors
  # POST /floors.xml
  def create
    @floor = Floor.new(params[:floor])

    respond_to do |format|
      if @floor.save
        flash[:notice] = 'Floor was successfully created.'
        format.html { redirect_to :action => :index, :building_id => @floor.building_id }
        format.xml  { render :xml => @floor, :status => :created, :location => @floor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @floor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /floors/1
  # PUT /floors/1.xml
  def update
    @floor = Floor.find(params[:id])

    respond_to do |format|
      if @floor.update_attributes(params[:floor])
        flash[:notice] = 'Floor was successfully updated.'
        format.html { redirect_to(@floor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @floor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /floors/1
  # DELETE /floors/1.xml
  def destroy
    @floor = Floor.find(params[:id])
    @building = @floor.building
    @floor.destroy

    respond_to do |format|
      format.html { redirect_to(@building) }
      format.xml  { head :ok }
    end
  end
  
end
