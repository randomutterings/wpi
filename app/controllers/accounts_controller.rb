class AccountsController < ApplicationController
  before_filter :admin_required, :except => [:new, :create]
  def index
    @accounts = Account.all
  end
  
  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(params[:account])
    @account.admin = true if Account.all.empty? || Account.admins.empty?
    if @account.save
      session[:account_id] = @account.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      flash[:notice] = "Your administrator account has been created." if @account.admin == true
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @account = Account.find(params[:id])
  end
  
  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      flash[:notice] = "Successfully updated account."
      redirect_to accounts_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    flash[:notice] = "Successfully destroyed account."
    redirect_to accounts_url
  end
end
