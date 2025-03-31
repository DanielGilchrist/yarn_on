require "../../../spec_helper"

describe Posts::Index do
  it "Shows post" do
    user = UserFactory.create
    post = PostFactory.create
    response = BrowserClient.auth_exec(user, Posts::Index)
    response.status_code.should eq(200)
    response.body.should contain(post.title)
    response.body.should contain(user.full_name)
  end
end
