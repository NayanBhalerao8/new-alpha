class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in
    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        # ||= this means if the current user is present then return the current user else set the current user
    end  

    def logged_in  
        !!current_user
    end
   
    def require_user 
        if !logged_in 
            flash[:alert] = "You must be logged in"
            redirect_to login_path
        end
    end
end
