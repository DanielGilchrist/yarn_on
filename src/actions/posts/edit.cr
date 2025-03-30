class Posts::Edit < BrowserAction
  get "/posts/:post_id/edit" do
    post = PostQuery.find(post_id)
    html EditPage,
      operation: SavePost.new(post, current_user: current_user),
      post: post
  end
end
