class StoriesController < ApplicationController
    before_action :find_story, only: [:show, :update, :destroy]
    
    def index
        if params[:user_id]
            stories = Story.where(user_id: params[:user_id])
        else 
            stories = Story.all 
        end 

        render json: stories, include: ["user"]
    end 

    def recently_created_stories
        recent_stories = Story.recently_created_stories

        render json: recent_stories, include: ["user"]
    end 

    def create
        story = current_user.stories.create(story_params)

        if story.save
            render json: { user: current_user, story: story}
        else 
            render json: { errors: story.errors.full_messages }
        end 
    end 

    def show
        if @story
            render json: { story: @story, characters: @story.characters, user: @story.user, comments: @story.comments }
        else 
            render json: { errors: ['Story could not be found'] }
        end 
    end 

    def update
        if @story.update(story_params)
            render json: { story: @story, user: current_user }
        else 
            render json: { errors: @story.errors.full_messages }
        end 
    end 

    def destroy
        @story.destroy
    end 

    private

    def find_story
        @story = Story.find_by_id(params[:id]) 
    end  

    def story_params(*args)
        params.require(:story).permit(:title, :summary)
    end 
end
