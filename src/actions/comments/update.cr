class Comments::Update < BrowserAction
  put "/comments/:comment_id" do
    comment = CommentQuery.find(comment_id)
    SaveComment.update(comment, params) do |operation, updated_comment|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(updated_comment.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, comment: updated_comment
      end
    end
  end
end
