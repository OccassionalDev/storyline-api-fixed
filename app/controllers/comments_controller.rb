class CommentsController < ApplicationController
    before_action :get_commentable_type

    def index
        comments = @commentable_type.comments 
        render json: comments, include: ["user"]
    end 

    def create
        if !is_owner?(@commentable_type)
            comment = current_user.comments.create(:commentable => @commentable_type, content: params[:content])

            if comment.save 
                render json: {  comment: comment, user: current_user }
            else
                render json: { errors: ['Comment could not be created.'] }
            end 
        else  
            render json: { errors: ['Comment could not be created.'] }
        end 
    end 

    private 

    def get_commentable_type
        if params[:story_id]
            @commentable_type = Story.find(params[:story_id])

        elsif params[:character_id]
            @commentable_type = Character.find(params[:character_id])
        else 
            render json: { errors: ['Page could not be commented on'] }
        end 
    end 
end
