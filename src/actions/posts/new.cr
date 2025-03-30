class Posts::New < BrowserAction
  get "/posts/new" do
    html NewPage, operation: SavePost.new(current_user: current_user)
  end
end
