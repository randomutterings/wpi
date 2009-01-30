class AgentsController < ApplicationController
  def index
    @agents = Agent.all
  end
  
  def show
    if params[:permalink].nil?
      @agent = Agent.find(params[:id])
    else
      @agent = Agent.find_by_permalink!(params[:permalink])
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
