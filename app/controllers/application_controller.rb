# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password
  before_filter :authenticate, :except => [:index, :show]
  before_filter :set_agent
  
  private
  
  def authenticate
    session[:is_authenticated] = authenticate_or_request_with_http_basic do |username, password|
      username == APP_CONFIG[:username] && password == APP_CONFIG[:password]
    end
  end
  
  def authenticated?
    session[:is_authenticated] == true
  end
  
  def set_agent
    if session[:agent].nil?
      if params[:permalink].nil?
        session[:agent] = Agent.find(:first).id
      else
        session[:agent] = Agent.find_by_permalink(params[:permalink])
      end
    end
  end

end
