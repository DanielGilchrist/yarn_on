class Posts::Comments::Delete < BrowserAction
  delete "/posts/:post_id/comments/:comment_id" do
    comment = CommentQuery.find(comment_id)

    if current_user.id != comment.author_id
      flash.failure = "You cannot delete someone else's comment"
      return redirect Posts::Show.with(post_id)
    end

    DeleteComment.delete(comment) do |_operation, _deleted|
      head HTTP::Status::OK
    end
  end
end

