class Posts::Index < BrowserAction
  get "/posts" do
    html IndexPage, posts: PostQuery.new.in_descending_order.preload_author
  end
end
