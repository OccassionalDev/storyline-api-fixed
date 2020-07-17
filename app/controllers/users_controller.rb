class UsersController < ApplicationController
    
    def index
        users = User.all 
        render json: { users: users } 
    end 

    def create 
        user = User.new(user_params)

        if user.save 
            current_user = user
            render json: { user: user }
        else 
            render json: { errors: user.errors.full_messages }
        end 
    end 

    def show
        user = User.find(params[:id])

        if user 
            render json: { user: user } 
        else 
            render json: { errors: ['Could not find a page for that user.'] }
        end
    end 

    private 

    def user_params(*args)
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end 
end
