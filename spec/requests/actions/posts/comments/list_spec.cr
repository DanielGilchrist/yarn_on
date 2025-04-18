require "../../../../spec_helper"

describe Posts::Comments::List do
  it "Shows comments" do
    user = UserFactory.create
    post = PostFactory.create
    comment = CommentFactory.create do |factory|
      factory.post_id(post.id)
      factory.author_id(user.id)
    end

    response = BrowserClient.exec(user, Posts::Comments::List.with(post))
    response.status_code.should eq(200)
    response.body.should contain(comment.content)
  end
end
