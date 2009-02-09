class ListingsController < ApplicationController
  def index
    if params[:all]
      @listings = Listing.all
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
  end
  
  def new
    @listing = Listing.new
    2.times { @listing.photos.build }
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
