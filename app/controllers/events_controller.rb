class EventsController < ApplicationController
  def index
    @date=params[:date] ? params[:date].to_date : Date.today
    @date = @date - (@date.day).days + 1.day
    if admin?
      @events = Event.all(:conditions => "day > '#{@date}' and day < '#{@date.next_month}'")
    else
      @events = Event.find_all_by_display(true, :conditions => "day > '#{@date}' and day < '#{@date.next_month}'")
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to @event
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to @event
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to events_url
  end
end
