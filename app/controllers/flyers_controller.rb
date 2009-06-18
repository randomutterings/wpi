class FlyersController < ApplicationController
  def index
    @flyers = Flyer.all
  end
  
  def show
    @flyer = Flyer.find(params[:id])
  end
  
  def new
    @flyer = Flyer.new
  end
  
  def create
    @flyer = Flyer.new(params[:flyer])
    if @flyer.save
      flash[:notice] = "Successfully created flyer."
      redirect_to @flyer
    else
      render :action => 'new'
    end
  end
  
  def edit
    @flyer = Flyer.find(params[:id])
  end
  
  def update
    @flyer = Flyer.find(params[:id])
    if @flyer.update_attributes(params[:flyer])
      flash[:notice] = "Successfully updated flyer."
      redirect_to @flyer
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @flyer = Flyer.find(params[:id])
    @flyer.destroy
    flash[:notice] = "Successfully destroyed flyer."
    redirect_to flyers_url
  end
end
