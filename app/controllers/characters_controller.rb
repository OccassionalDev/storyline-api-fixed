class CharactersController < ApplicationController
    before_action :find_character, only: [:show, :update, :destroy]

    def index
        if params[:user_id]
            characters = Character.where(user_id: params[:user_id])

        elsif params[:story_id]
            characters = Story.where(story_id: params[:story_id])
        else 
            characters = Character.all 
        end 

        render json: characters, include: ["story", "user"]
    end 

    def recently_created_characters
        recent_characters = Character.recently_created_characters

        render json: recent_characters, include: ["story", "user"]
    end

    def create
        character = current_user.characters.create(character_params)
        
        if character.save
            render json: { user: current_user, character: character }
        else 
            render json: { errors: character.errors.full_messages }
        end 
    end 

    def show
        if @character
            render json: { character: @character, user: @character.user, story: @character.story, comments: @character.comments } 
        else 
            render json: { errors: ['Character could not be found'] }
        end 
    end 

    def update
        if @character.update(character_params)
            render json: @character, include: ["user"] 
        else 
            render json: { errors: @character.errors.full_messages }
        end 
    end 

    def destory
        @character.destory 
    end 

    private

    def find_character
        @character = Character.find_by_id(params[:id])
    end 

    def character_params(*args)
        params.require(:character).permit(:name, :age, :gender, :species, :overview, :personality, :story_id)
    end 
end
