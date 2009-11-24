class OpportunitiesController < ApplicationController
  # GET /opportunities
  # GET /opportunities.xml
  def index
    @opportunities = Opportunity.all
    @statuses = StaticItem.find(:all, :conditions => { :list_name => 'OpportunityStatus'})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opportunities }
    end
  end

  # GET /opportunities/1
  # GET /opportunities/1.xml
  def show
    @opportunity = Opportunity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opportunity }
    end
  end

  # GET /opportunities/new
  # GET /opportunities/new.xml
  def new
    @opportunity = Opportunity.new
    @business_units = StaticItem.find(:all, :conditions => {:list_name => 'BusinessUnit'})
    @move_types = StaticItem.find(:all, :conditions => {:list_name => 'MoveType'})
    @opportunity_statuses = StaticItem.find(:all, :conditions => {:list_name => 'OpportunityStatus'})
    @floors = Floor.find(:all).sort_by { |flr| [flr[:building_id], flr[:floor_level]]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opportunity }
    end
  end

  # GET /opportunities/1/edit
  def edit
    @opportunity = Opportunity.find(params[:id])
    @business_units = StaticItem.find(:all, :conditions => {:list_name => 'BusinessUnit'})
    @move_types = StaticItem.find(:all, :conditions => {:list_name => 'MoveType'})
    @opportunity_statuses = StaticItem.find(:all, :conditions => {:list_name => 'OpportunityStatus'})
    @floors = Floor.find(:all)
  end

  # POST /opportunities
  # POST /opportunities.xml
  def create
    @opportunity = Opportunity.new(params[:opportunity])
    @building = Building.find(params[:building_id])
    
    respond_to do |format|
      if @opportunity.save
        flash[:notice] = 'Opportunity was successfully created.'
        format.html { redirect_to(opportunity_path(@opportunity)) }
        format.xml  { render :xml => @opportunity, :status => :created, :location => @opportunity }
      else
        flash[:error] = 'Opportunity could not be created.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @opportunity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /opportunities/1
  # PUT /opportunities/1.xml
  def update
    @opportunity = Opportunity.find(params[:id])
    @floor = @opportunity.floor
    @building = @floor.building

    respond_to do |format|
      if @opportunity.update_attributes(params[:opportunity])
        flash[:notice] = 'Opportunity was successfully updated.'
        format.html { redirect_to(opportunity_path(@opportunity)) }
        format.xml  { head :ok }
      else
        flash[:error] = 'Opportunity could not be updated.'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opportunity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunities/1
  # DELETE /opportunities/1.xml
  def destroy
    @opportunity = Opportunity.find(params[:id])
    @building = @opportunity.floor.building
    @opportunity.destroy

    respond_to do |format|
      flash[:notice] = 'Opportunity was deleted.'
      format.html { redirect_to(building_path(@building)) }
      format.xml  { head :ok }
    end
  end
end
