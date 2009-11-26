class StaticItemsController < ApplicationController
  
  filter_resource_access
  
  # GET /static_items
  # GET /static_items.xml
  def index
    @static_items = StaticItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @static_items }
    end
  end

  # GET /static_items/1
  # GET /static_items/1.xml
  def show
    @static_item = StaticItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @static_item }
    end
  end

  # GET /static_items/new
  # GET /static_items/new.xml
  def new
    @static_item = StaticItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @static_item }
    end
  end

  # GET /static_items/1/edit
  def edit
    @static_item = StaticItem.find(params[:id])
  end

  # POST /static_items
  # POST /static_items.xml
  def create
    @static_item = StaticItem.new(params[:static_item])

    respond_to do |format|
      if @static_item.save
        flash[:notice] = 'StaticItem was successfully created.'
        format.html { redirect_to(@static_item) }
        format.xml  { render :xml => @static_item, :status => :created, :location => @static_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @static_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /static_items/1
  # PUT /static_items/1.xml
  def update
    @static_item = StaticItem.find(params[:id])

    respond_to do |format|
      if @static_item.update_attributes(params[:static_item])
        flash[:notice] = 'StaticItem was successfully updated.'
        format.html { redirect_to(@static_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @static_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /static_items/1
  # DELETE /static_items/1.xml
  def destroy
    @static_item = StaticItem.find(params[:id])
    @static_item.destroy

    respond_to do |format|
      format.html { redirect_to(static_items_url) }
      format.xml  { head :ok }
    end
  end
end
