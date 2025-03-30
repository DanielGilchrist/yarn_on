class Posts::Show < BrowserAction
  get "/posts/:post_id" do
    html ShowPage, post: PostQuery.find(post_id)
  end
end
