class EmailsController < ApplicationController
  before_filter :authenticate, :only => [:index, :show, :destroy]
  
  def index
    @emails = Email.all
  end
  
  def show
    @email = Email.find(params[:id])
  end
  
  def new
    session[:email_type] = params[:email_type]
    @email = Email.new
  end
  
  def create
    @email = Email.new(params[:email])
    if @email.save
      flash[:notice] = "Successfully created email."
      if authenticated?
        redirect_to @email
      elsif session[:agent]
        redirect_to agent_path(session[:agent])
      else
        redirect_to page_permalink_path("home")
      end
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    flash[:notice] = "Successfully destroyed email."
    redirect_to emails_url
  end
end
