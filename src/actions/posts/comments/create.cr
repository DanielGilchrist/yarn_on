class Posts::Comments::Create < BrowserAction
  post "/posts/:post_id/comments" do
    post = PostQuery.new.find(post_id)
    SaveComment.create(params, current_user: current_user, post: post) do
      comments = CommentQuery.new.for_list(post)
      component ::Comments::List, comments: comments
    end
  end
end
