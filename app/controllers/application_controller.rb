# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password
  before_filter :set_agent
  
  private
  
  def set_agent
    if session[:agent].nil?
      if params[:permalink].nil? || params[:permalink] == 'home'
        session[:agent] = Agent.find(:first).id
      else
        session[:agent] = Agent.find_by_permalink(params[:permalink])
      end
    end
    @agent = Agent.find(session[:agent])
  end

end
