class SessionsController < ApplicationController 
    def create
        @user = User.find_by_email(params[:email])

        if @user && @user.authenticate(params[:password])
            set_user(user)
            render "users/user"
        else 
            render_form_errors(['Invalid email or password.'])
        end 
    end  

    def destroy
        session.delete :user_id
    end 
end 