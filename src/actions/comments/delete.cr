class Comments::Delete < BrowserAction
  delete "/comments/:comment_id" do
    comment = CommentQuery.find(comment_id)
    DeleteComment.delete(comment) do |_operation, _deleted|
      flash.success = "Deleted the comment"
      redirect Index
    end
  end
end
