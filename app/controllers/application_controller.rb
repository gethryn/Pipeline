# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  #include Authentication

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter { |c| Authorization.current_user = c.current_user }
  before_filter :set_user_time_zone

  helper_method :current_user
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  protected
  
  def permission_denied
    flash[:error] = "Sorry, you are not authorized to view that page"
    redirect_to root_url
  end
  
  private
  
  def set_user_time_zone
    if current_user.nil?
      Time.zone = "Sydney"
    else
      Time.zone = current_user.time_zone ||= "Sydney"
    end
  end
  
end
