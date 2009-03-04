class AccountsController < ApplicationController
  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(params[:account])
    @account.admin = true if Account.all.empty?
    if @account.save
      session[:account_id] = @account.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      flash[:notice] = "Your administrator account has been created." if @account.admin == true
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
