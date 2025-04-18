require "../../../../spec_helper"

describe Posts::Comments::Create do
  it "creates a comment" do
    user = UserFactory.create
    post = PostFactory.create
    comment_content = "This is a new test comment!"

    response = BrowserClient.exec(
      user,
      Posts::Comments::Create.with(post),
      comment: { content: comment_content }
    )

    response.status_code.should eq(200)
    response.body.should contain(to_markdown_html(comment_content))

    saved_comment = CommentQuery.new.author_id(user.id).post_id(post.id).first
    saved_comment.content.should eq(comment_content)
  end

  it "doesn't create a comment with blank content" do
    user = UserFactory.create
    post = PostFactory.create

    response = BrowserClient.exec(
      user,
      Posts::Comments::Create.with(post),
      comment: { content: "" }
    )

    response.status_code.should eq(200)
    response.body.should contain("No comments yet.")

    CommentQuery.new.author_id(user.id).post_id(post.id).select_count.should eq(0)
  end
end
