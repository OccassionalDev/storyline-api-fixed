module CommentsHelper
    def format_created_at(comment)
        comment.created_at.strftime("%m/%e/%Y")
    end 
end
