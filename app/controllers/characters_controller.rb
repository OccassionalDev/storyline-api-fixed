class CharactersController < ApplicationController
    before_action :find_character, only: [:show, :update, :destroy]
    before_action :require_login, only: [:create, :update, :destroy]

    def index
        if params[:user_id]
            @characters = Character.where(user_id: params[:user_id])

        elsif params[:story_id]
            @characters = Character.where(story_id: params[:story_id])
        else 
            @characters = Character.all 
        end 

        render :index
    end 

    def recently_created
        if params[:user_id]
            @characters = Character.where(user_id: params[:user_id]).recently_created
        else 
            @characters = Character.recently_created
        end 

        render :index
    end

    def create
        story = Story.find_by_id(params[:story_id])

        @character = Character.new(character_params)
        @character.user = @current_user
        @character.story = story
        
        if @character.save
            render :character
        else 
            render_form_errors(@character.errors.full_messages)
        end 
    end 

    def show
        if @character
            render :show 
        else 
            page_not_found
        end 
    end 

    def update
        if can_edit_or_destroy?(@character)
            if @character.update(character_params)
                render :character 
            else 
                render_form_errors(@character.errors.full_messages)
            end 
        else  
            action_could_not_be_performed
        end 
    end 

    def destroy
        if can_edit_or_destroy?(@character)
            @character.destroy 
            render :character
        else   
            action_could_not_be_performed
        end 
    end 

    private

    def find_character
        @character = Character.find_by_id(params[:id])
    end 

    def character_params(*args)
        params.require(:character).permit(:name, :age, :gender, :species, :overview, :personality)
    end 
end
