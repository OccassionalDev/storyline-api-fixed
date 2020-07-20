class CommentsController < ApplicationController
    before_action :get_commentable_type
    before_action :require_login, only: [:create]

    def index
        if @commentable_type != nil
            @comments = @commentable_type.comments 

            render :index
        else 
            page_not_found
        end 
    end 

    def create
        if !is_creator?(@commentable_type)
            comment = @current_user.comments.create(commentable: @commentable_type, content: params[:content])

            if comment.save 
                render json: {  comment: comment, user: @current_user }
            else
                action_could_not_be_performed
            end 
        else  
            action_could_not_be_performed
        end 
    end 

    private 

    def get_commentable_type
        if params[:story_id]
            @commentable_type = Story.find_by_id(params[:story_id])

        elsif params[:character_id]
            @commentable_type = Character.find_by_id(params[:character_id])
        else 
            page_not_found
        end 
    end 
end
