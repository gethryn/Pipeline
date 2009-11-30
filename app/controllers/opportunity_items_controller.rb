class OpportunityItemsController < ApplicationController
  before_filter :new_opportunity_item_from_params, :only => [:new]
  before_filter :create_opportunity_item_from_params, :only => [:create]
  filter_access_to :all, :attribute_check => true
  #filter_resource_access
  
  def index
    @opportunity_items = OpportunityItem.all
  end
  
  def new
    #@opportunity_item = OpportunityItem.new(:opportunity_id => params[:opportunity_id]) unless params[:opportunity_id].nil?
    #@opportunity_item = OpportunityItem.new
    @floors = Floor.find(:all, :include => :building, :order => "buildings.name, floors.floor_Level")
  end
  
  def create
    #@opportunity_item = OpportunityItem.new(params[:opportunity_item])
    if @opportunity_item.save
      flash[:notice] = "Successfully created opportunity item."
      redirect_to opportunity_url(@opportunity_item.opportunity_id)
    else
      render :action => 'new'
    end
  end
  
  def edit
    #@opportunity_item = OpportunityItem.find(params[:id])
    @floors = Floor.find(:all, :include => :building, :order => "buildings.name, floors.floor_Level")
  end
  
  def update
    #@opportunity_item = OpportunityItem.find(params[:id])
    if @opportunity_item.update_attributes(params[:opportunity_item])
      flash[:notice] = "Successfully updated opportunity item."
      redirect_to opportunity_url(@opportunity_item.opportunity)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    #@opportunity_item = OpportunityItem.find(params[:id])
    @opportunity_item.destroy
    flash[:notice] = "Successfully destroyed opportunity item."
    redirect_to opportunity_url(@opportunity_item.opportunity)
  end
  
  protected
  
  def new_opportunity_item_from_params
    if params[:opportunity_id].nil?
      @opportunity_item = OpportunityItem.new
    else
      @opportunity_item = OpportunityItem.new(:opportunity_id => params[:opportunity_id])
    end
  end
  
  def create_opportunity_item_from_params
    @opportunity_item = OpportunityItem.new(params[:opportunity_item])
  end
  
end
