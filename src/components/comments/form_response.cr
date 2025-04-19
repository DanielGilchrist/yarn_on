class Comments::FormResponse < BaseComponent
  needs current_user : User
  needs post : Post
  needs comments : CommentQuery
  needs operation : SaveComment
  needs newest_comment_id : Int64? = nil

  def render
    div do
      mount ::Comments::List,
        current_user: current_user,
        post: post,
        comments: comments,
        newest_comment_id: newest_comment_id

      unless operation.saved?
        mount ::Comments::ErrorList, operation: operation
      end
    end
  end
end
