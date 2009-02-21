class EmailsController < ApplicationController
  before_filter :authenticate, :only => [:index, :show, :new, :create, :destroy]
  
  def index
    @emails = Email.all
  end
  
  def show
    @email = Email.find(params[:id])
  end
  
  def new
    @email = Email.new
  end
  
  def create
    @email = Email.new(params[:email])
    @email.from = Agent.find(session[:agent]).email_with_name
    @email.to = @email.to.join(", ") unless @email.to.nil?
    if @email.save
      if Notifier.deliver_lead_email(@email.from, params[:email][:to], @email.subject, @email.body)
        flash[:notice] = "Successfully created email."
        redirect_to @email
      else
        render :action => 'new'
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
