class Posts::Comments::List < BrowserAction
  get "/posts/:post_id/comments" do
    post = PostQuery.new.find(post_id)
    comments = CommentQuery.new.for_list(post)

    component ::Comments::List, current_user: current_user, post: post, comments: comments
  end
end
