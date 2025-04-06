class Comments::New < BrowserAction
  get "/comments/new" do
    html NewPage, operation: SaveComment.new
  end
end
