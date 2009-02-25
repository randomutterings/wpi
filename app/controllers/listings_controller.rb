class ListingsController < ApplicationController
  def index
    if params[:all]
      @listings = Listing.all
    elsif params[:featured]
      @listings = Listing.find_all_by_featured(true)
    else
      @listings = Listing.find_all_by_display(true)
    end
  end
  
  def show
    if params[:permalink]
      @listing = Listing.find_by_permalink!(params[:permalink])
    else
      @listing = Listing.find(params[:id])
    end
    if params[:print] == true.to_s
      render :partial => 'print', :layout => 'print'
    end
  end
  
  def new
    @listing = Listing.new
  end
  
  def create
    @listing = Listing.new(params[:listing])
    if @listing.save
      flash[:notice] = "Successfully created listing."
      redirect_to @listing
    else
      render :action => 'new'
    end
  end
  
  def edit
    @listing = Listing.find(params[:id])
  end
  
  def update
    params[:listing][:photos_attributes].delete_if {|key, value| value.nil? }
    logger.error "<---begin log #{params[:listing][:photos_attributes]} end log --->"
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(params[:listing])
      flash[:notice] = "Successfully updated listing."
      redirect_to @listing
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:notice] = "Successfully destroyed listing."
    redirect_to listings_url
  end
end
