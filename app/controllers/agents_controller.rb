class AgentsController < ApplicationController
  before_filter [:login_required, :admin_or_agent_required], :except => [:index, :show]
  
  def admin_or_agent_required
    if params[:id]
      Agent.find(params[:id]).permalink == Account.find(session[:account_id]).username || admin_required
    else
      admin_required
    end
  end
  
  def index
    @agents = Agent.all
  end
  
  def show
    @email = Email.new
    if params[:permalink].nil?
      if params[:id].nil?
        @agent = Agent.find(session[:agent])
      else
        @agent = Agent.find(params[:id])
      end
    else
      session[:agent] = Agent.find_by_permalink(params[:permalink])
      redirect_to :controller => "pages", :action => "show", :permalink => "home"
    end
  end
  
  def new
    @agent = Agent.new
  end
  
  def create
    @agent = Agent.new(params[:agent])
    if @agent.save
      flash[:notice] = "Successfully created agent."
      redirect_to @agent
    else
      render :action => 'new'
    end
  end
  
  def edit
    @agent = Agent.find(params[:id])
  end
  
  def update
    @agent = Agent.find(params[:id])
    if @agent.update_attributes(params[:agent])
      flash[:notice] = "Successfully updated agent."
      redirect_to @agent
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @agent = Agent.find(params[:id])
    @agent.destroy
    flash[:notice] = "Successfully destroyed agent."
    redirect_to agents_url
  end
end
