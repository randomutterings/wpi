class LeadStatusesController < ApplicationController
  before_filter :authenticate, :only => [:index, :show, :new, :create, :edit, :update, :destroy]
  def index
    @lead_statuses = LeadStatus.all
  end
  
  def show
    @lead_status = LeadStatus.find(params[:id])
  end
  
  def new
    @lead_status = LeadStatus.new
  end
  
  def create
    @lead_status = LeadStatus.new(params[:lead_status])
    if @lead_status.save
      flash[:notice] = "Successfully created leadstatus."
      redirect_to @lead_status
    else
      render :action => 'new'
    end
  end
  
  def edit
    @lead_status = LeadStatus.find(params[:id])
  end
  
  def update
    @lead_status = LeadStatus.find(params[:id])
    if @lead_status.update_attributes(params[:lead_status])
      flash[:notice] = "Successfully updated leadstatus."
      redirect_to @lead_status
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @lead_status = LeadStatus.find(params[:id])
    @lead_status.destroy
    flash[:notice] = "Successfully destroyed leadstatus."
    redirect_to lead_statuses_url
  end
end
