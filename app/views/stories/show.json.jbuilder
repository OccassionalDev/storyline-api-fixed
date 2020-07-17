json.story @story, :id, :title, :summary

json.characters do 
    json.array! @story.characters
end 

json.user @story.user

json.canEdit can_edit_or_destroy?(@story)