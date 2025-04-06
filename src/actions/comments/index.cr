class Comments::Index < BrowserAction
  get "/comments" do
    html IndexPage, comments: CommentQuery.new
  end
end
