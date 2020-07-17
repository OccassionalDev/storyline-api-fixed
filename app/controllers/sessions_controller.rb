class SessionsController < ApplicationController 
    def create
        user = User.find_by_email(params[:email])

        if user && user.authenticate(params[:password])
            current_user = user
            render json: { user: user }
        else 
            render json: { errors: ['Invalid email or password.'] }
        end 
    end  

    def destroy
        session.delete :user_id
    end 
end 