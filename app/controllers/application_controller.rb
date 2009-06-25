# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem
  
  helper_method :admin?

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  protected
  
  def authorize
    unless admin?
      flash[:notice] = "Grrr... Czy na pewno masz do tego uprawnienia?"
      redirect_to root_path
      false
    end
  end
  
  def admin?
    authorized?
  end
end
