json.comments do 
    json.array! @comments, :id, :user, :content, :created_at
end 

json.canComment @can_comment