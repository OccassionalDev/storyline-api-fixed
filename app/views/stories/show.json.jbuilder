json.story @story, :id, :title, :summary

json.characters do 
    json.array! @story.characters
end 

json.user @story.user