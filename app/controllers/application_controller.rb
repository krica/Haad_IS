# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def logout_user
    session[:user_id] = nil
  end

  def login_required
    if !session[:user_id].present?
      redirect_to "/"
    end
  end
  
  def admin_required
    if session[:user_id].present?
      if @user = User.find(session[:user_id])
        if !@user.is_admin?
          redirect_to "/"
        end
      end
    else
      redirect_to "/"
    end
  end
private

 def adjust_format_for_iphone
    if (request.env["HTTP_USER_AGENT"] && (request.env["HTTP_USER_AGENT"][/(iPhone)/]== "iPhone"))
      request.format = :iphone
    else
      return true
    end
  end



end
