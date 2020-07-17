class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    include CurrentUserConcern

    helper_method :set_user, :logged_in?, :require_login, :is_creator?, :can_comment_on_page?, :can_edit_or_destroy?

    def set_user(user)
        session[:user_id] = user.id 
    end 

    def logged_in?
        @current_user != nil
    end 

    def is_creator(element)
        @current_user.id === element.user_id 
    end 

    def can_comment_on_page?(element)
        logged_in? && !is_creator(element)
    end 

    def can_edit_or_destroy?(element)
        logged_in? && is_creator(element)
    end 

    private

    def require_login
        render json: { errors: ["You must be logged in to do that action."] } unless logged_in?
    end 
end
