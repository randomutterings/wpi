class LeadReferralTypesController < ApplicationController
  def index
    @lead_referral_types = LeadReferralType.all
  end
  
  def show
    @lead_referral_type = LeadReferralType.find(params[:id])
  end
  
  def new
    @lead_referral_type = LeadReferralType.new
  end
  
  def create
    @lead_referral_type = LeadReferralType.new(params[:lead_referral_type])
    if @lead_referral_type.save
      flash[:notice] = "Successfully created leadreferraltype."
      redirect_to @lead_referral_type
    else
      render :action => 'new'
    end
  end
  
  def edit
    @lead_referral_type = LeadReferralType.find(params[:id])
  end
  
  def update
    @lead_referral_type = LeadReferralType.find(params[:id])
    if @lead_referral_type.update_attributes(params[:lead_referral_type])
      flash[:notice] = "Successfully updated leadreferraltype."
      redirect_to @lead_referral_type
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @lead_referral_type = LeadReferralType.find(params[:id])
    @lead_referral_type.destroy
    flash[:notice] = "Successfully destroyed leadreferraltype."
    redirect_to lead_referral_types_url
  end
end
