class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in, :require_login

    def current_user=(user)
        session[:user_id] = user.id 
    end 

    def current_user 
        User.find_by_id(session[:user_id])
    end 

    def logged_in?
        current_user != nil
    end 

    private

    def require_login
        render json: { errors: ["You must be logged in to do that action."] } unless logged_in?
    end 
end
