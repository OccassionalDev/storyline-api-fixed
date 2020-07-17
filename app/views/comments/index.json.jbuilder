json.comments do 
    json.array! @comments, :id, :user, :content, :created_at
end 

json.canComment can_edit_or_destroy?(@commentable_type)