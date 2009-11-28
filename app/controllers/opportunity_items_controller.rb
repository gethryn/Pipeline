class OpportunityItemsController < ApplicationController
  
  filter_resource_access
  
  def index
    @opportunity_items = OpportunityItem.all
  end
  
  def new
    #@opportunity_item = OpportunityItem.new
    @floors = Floor.find(:all, :include => :building, :order => "buildings.name, floors.floor_Level")
  end
  
  def create
    #@opportunity_item = OpportunityItem.new(params[:opportunity_item])
    if @opportunity_item.save
      flash[:notice] = "Successfully created opportunity item."
      redirect_to opportunity_items_url
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
      redirect_to opportunity_items_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    #@opportunity_item = OpportunityItem.find(params[:id])
    @opportunity_item.destroy
    flash[:notice] = "Successfully destroyed opportunity item."
    redirect_to opportunity_items_url
  end
end
