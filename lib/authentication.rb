# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.
# 
#   <% if logged_in? %>
#     Welcome <%= current_user.username %>! Not you?
#     <%= link_to "Log out", logout_path %>
#   <% else %>
#     <%= link_to "Sign up", signup_path %> or
#     <%= link_to "log in", login_path %>.
#   <% end %>
# 
# You can also restrict unregistered users from accessing a controller using
# a before filter. For example.
# 
#   before_filter :login_required, :except => [:index, :show]
module Authentication
  def self.included(controller)
    controller.send :helper_method, :current_account, :logged_in?, :admin?
  end
  
  def current_account
    @current_account ||= Account.find(session[:account_id]) if session[:account_id]
  end
  
  def logged_in?
    current_account
  end
  
  def login_required(admin = nil)
    unless logged_in?
      flash[:error] = "You must first log in or sign up before accessing this page."
      redirect_to login_url
    end
  end
  
  def admin?
    logged_in? && current_account.admin == true
  end
  
  def admin_required
    unless logged_in? && current_account.admin == true
      flash[:error] = "Only administrators can access this page"
      redirect_to root_url
    end
  end
  
end
