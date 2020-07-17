json.story @story, partial: 'stories/partials/storyInfo', as: :story

json.characters do 
    json.array! @story.characters
end 

json.canEdit can_edit_or_destroy?(@story)