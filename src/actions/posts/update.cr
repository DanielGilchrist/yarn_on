class Posts::Update < BrowserAction
  put "/posts/:post_id" do
    post = PostQuery.find(post_id)
    SavePost.update(post, params, current_user: current_user) do |operation, updated_post|
      if operation.saved?
        flash.success = "Your post has been successfully updated."
        redirect Show.with(updated_post.id)
      else
        flash.failure = "There was an issue saving your post."
        html EditPage, operation: operation, post: updated_post
      end
    end
  end
end
