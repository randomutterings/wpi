class LeadTypesController < ApplicationController
  before_filter :authenticate
  def index
    @lead_types = LeadType.all
  end
  
  def show
    @lead_type = LeadType.find(params[:id])
  end
  
  def new
    @lead_type = LeadType.new
  end
  
  def create
    @lead_type = LeadType.new(params[:lead_type])
    if @lead_type.save
      flash[:notice] = "Successfully created leadtype."
      redirect_to @lead_type
    else
      render :action => 'new'
    end
  end
  
  def edit
    @lead_type = LeadType.find(params[:id])
  end
  
  def update
    @lead_type = LeadType.find(params[:id])
    if @lead_type.update_attributes(params[:lead_type])
      flash[:notice] = "Successfully updated leadtype."
      redirect_to @lead_type
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @lead_type = LeadType.find(params[:id])
    @lead_type.destroy
    flash[:notice] = "Successfully destroyed leadtype."
    redirect_to lead_types_url
  end
end
