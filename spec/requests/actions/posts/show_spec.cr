require "../../../spec_helper"

describe Posts::Show do
  it "Renders a post" do
    user = UserFactory.create
    post = PostFactory.create
    response = BrowserClient.auth_exec(user, Posts::Show.with(post))
    response.status_code.should eq(200)
    response.body.should contain(post.title)
    response.body.should contain(post.content)
  end

  it "404s for a non existant post" do
    user = UserFactory.create
    response = BrowserClient.auth_exec(user, Posts::Show.with(100))
    response.status_code.should eq(404)
  end
end
