class Posts::Comments::Create < BrowserAction
  post "/posts/:post_id/comments" do
    post = PostQuery.find(post_id)
    SaveComment.create(params, current_user: current_user, post: post) do |operation, comment|
      comments = CommentQuery.new.for_list(post)

      component ::Comments::FormResponse,
        current_user: current_user,
        post: post,
        comments: comments,
        operation: operation,
        newest_comment_id: comment.try(&.id)
    end
  end
end
