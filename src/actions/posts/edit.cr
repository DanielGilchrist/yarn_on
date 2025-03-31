class Posts::Edit < BrowserAction
  get "/posts/:post_id/edit" do
    post = PostQuery.find(post_id)

    if post.author_id != current_user.id
      flash.failure = "You are not permitted to edit this post."
      return redirect Posts::Show.with(post)
    end

    html EditPage,
      operation: SavePost.new(post, current_user: current_user),
      post: post
  end
end
