class Posts::Show < BrowserAction
  get "/posts/:post_id" do
    post = PostQuery.find(post_id)
    html ShowPage, post: PostQuery.preload_author(post)
  end
end
