class BuildingsController < ApplicationController

  
  # GET /buildings
  # GET /buildings.xml
  def index
    @buildings = Building.find(:all, :include => :floors )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @buildings }
    end
  end

  # GET /buildings/1
  # GET /buildings/1.xml
  def show
    @building = Building.find(params[:id])
    @cbd = Building.in_cbd.collect(&:short_name).sort
    @metro = Building.in_metro.collect(&:short_name).sort

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @building }
    end
  end

  # GET /buildings/new
  # GET /buildings/new.xml
  def new
    @states = StaticItem.find(:all, :conditions => {:list_name => 'State'})
    @zones = StaticItem.find(:all, :conditions => {:list_name => 'BuildingZone'})
    @building = Building.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @building }
    end
  end

  # GET /buildings/1/edit
  def edit
    @building = Building.find(params[:id])
    @states = StaticItem.find(:all, :conditions => {:list_name => 'State'})
    @zones = StaticItem.find(:all, :conditions => {:list_name => 'BuildingZone'})
  end

  # POST /buildings
  # POST /buildings.xml
  def create
    @building = Building.new(params[:building])

    respond_to do |format|
      if @building.save
        flash[:notice] = 'Building was successfully created.'
        format.html { redirect_to(@building) }
        format.xml  { render :xml => @building, :status => :created, :location => @building }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @building.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /buildings/1
  # PUT /buildings/1.xml
  def update
    @building = Building.find(params[:id])

    respond_to do |format|
      if @building.update_attributes(params[:building])
        flash[:notice] = 'Building was successfully updated.'
        format.html { redirect_to(@building) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @building.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.xml
  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    respond_to do |format|
      format.html { redirect_to(buildings_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def building_capacity_column_data
    @buildings = Building.find(:all, :include => :floors).sort_by { |b| [b[:building_zone], -b.capacity] }
    chart = Ambling::Data::ColumnChart.new
    chart.graphs << Ambling::Data::ColumnGraph.new([], :title => "Capacity")
    @buildings.each do |b|
      color = b.building_zone == 'CBD' ? '#3399FF' : '#66CC00'
      chart.series << Ambling::Data::Value.new(b.short_name, :xid => b.id, :color => color)
      chart.graphs.last << Ambling::Data::Value.new(b.capacity, :xid => b.id, :color => color)
    end
    render :xml => chart.to_xml
  end
end
