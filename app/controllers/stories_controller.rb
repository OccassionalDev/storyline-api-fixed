class StoriesController < ApplicationController
    before_action :find_story, only: [:show, :update, :destroy]
    before_action :require_login, only: [:create, :update, :destroy]
    
    def index
        if params[:user_id]
            @stories = Story.where(user_id: params[:user_id])
        else 
            @stories = Story.all 
        end 

        render :index
    end 

    def recently_created_stories
        @stories = Story.recently_created_stories

        render :index
    end 

    def create
        @story = @current_user.stories.create(story_params)

        if @story.save
            render :story
        else 
            render_form_errors(@story.errors.full_messages)
        end 
    end 

    def show
        if @story
            render :show
        else 
            page_not_found
        end 
    end 

    def update
        if can_edit_or_destroy?(@story)
            if @story.update(story_params)
                render :story
            else 
                render_form_errors(@story.errors.full_messages)
            end 
        else 
            action_could_not_be_performed
        end 
    end 

    def destroy
        if can_edit_or_destroy?(@story)
            @story.destroy
            render :story
        else  
           action_could_not_be_performed
        end 
    end 

    private

    def find_story
        @story = Story.find_by_id(params[:id]) 
    end  

    def story_params(*args)
        params.require(:story).permit(:title, :summary)
    end 
end
