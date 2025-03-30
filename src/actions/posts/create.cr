class Posts::Create < BrowserAction
  post "/posts" do
    SavePost.create(params, current_user: current_user) do |operation, post|
      if post
        flash.success = "Your post has been created!"
        redirect Show.with(post.id)
      else
        flash.failure = "There was an error creating your post."
        html NewPage, operation: operation
      end
    end
  end
end
