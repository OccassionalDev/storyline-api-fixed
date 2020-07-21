json.comments do 
    json.array! @comments, partial: 'comments/partials/commentInfo', as: :comment
end 

json.canComment can_comment_on_page?(@commentable_type)