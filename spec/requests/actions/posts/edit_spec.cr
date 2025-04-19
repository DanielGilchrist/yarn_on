require "../../../spec_helper"

describe Posts::Edit do
  it "Shows editing a post" do
    user = UserFactory.create
    post = PostFactory.create(&.author_id(user.id))
    response = BrowserClient.exec(user, Posts::Edit.with(post))
    response.status_code.should eq(200)
    response.body.should contain(post.title)
    response.body.should contain(post.content)
  end

  it "Redirects if current user isn't author" do
    user = UserFactory.create
    post = PostFactory.create
    response = BrowserClient.exec(user, Posts::Edit.with(post))
    response.status_code.should eq(302)
  end
end
