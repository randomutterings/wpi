class DocumentsController < ApplicationController
  before_filter :login_required
  def index
    @documents = Document.viewable(session[:account_id])
  end
  
  def show
    @document = Document.find(params[:id])
  end
  
  def new
    @document = Document.new
  end
  
  def create
    @document = Document.new(params[:document])
    @document.accounts << Account.find(session[:account_id])
    if @document.save
      flash[:notice] = "Successfully created document."
      redirect_to documents_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @document = Document.find(params[:id])
  end
  
  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      flash[:notice] = "Successfully updated document."
      redirect_to @document
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:notice] = "Successfully destroyed document."
    redirect_to documents_url
  end
end
