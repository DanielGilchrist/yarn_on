class Posts::Comments::Create < BrowserAction
  post "/posts/:post_id/comments" do
    post = PostQuery.find(post_id)
    SaveComment.create(params, current_user: current_user, post: post) do
      comments = CommentQuery.new.for_list(post)
      component ::Comments::List, current_user: current_user, post: post, comments: comments
    end
  end
end
