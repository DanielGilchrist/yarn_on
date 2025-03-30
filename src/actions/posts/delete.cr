class Posts::Delete < BrowserAction
  delete "/posts/:post_id" do
    post = PostQuery.find(post_id)
    DeletePost.delete(post) do |_operation, _deleted|
      flash.success = "Deleted the post"
      redirect Index
    end
  end
end
