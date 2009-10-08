class PagesController < ApplicationController
  before_filter :admin_required, :except => [:index, :show]
  def index
    @pages = Page.all
  end
  
  def show
    if params[:permalink]
      if params[:permalink] == "home"
        @featured = Listing.find(:all, :order=>"featured DESC")
        @articles = Article.all
        @flyers = Flyer.all
        render :partial => "home", :layout => "application"
      elsif params[:permalink] == "mortgage_calculator"
        render :partial => "mortgage_calculator", :layout => "application"
      else
        @page = Page.find_by_permalink!(params[:permalink])
      end
    else
      if params[:id].nil?
        render :partial => "home", :layout => "application"
      else
        @page = Page.find(params[:id])
      end      
    end
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to @page
    else
      render :action => 'new'
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to @page
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
    redirect_to pages_url
  end
end
