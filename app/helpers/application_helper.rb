# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def authenticated?
    session[:is_authenticated] == true
  end

end
