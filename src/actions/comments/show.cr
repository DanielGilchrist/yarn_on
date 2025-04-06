class Comments::Show < BrowserAction
  get "/comments/:comment_id" do
    html ShowPage, comment: CommentQuery.find(comment_id)
  end
end
