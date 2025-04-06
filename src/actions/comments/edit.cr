class Comments::Edit < BrowserAction
  get "/comments/:comment_id/edit" do
    comment = CommentQuery.find(comment_id)
    html EditPage,
      operation: SaveComment.new(comment),
      comment: comment
  end
end
