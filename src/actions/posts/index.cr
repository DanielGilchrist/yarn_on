class Posts::Index < BrowserAction
  get "/posts" do
    html IndexPage, posts: PostQuery.new
  end
end
