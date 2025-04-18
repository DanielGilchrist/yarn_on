class CommentFactory < Avram::Factory
  def initialize
    content "I'm a test comment!"
    author_id UserFactory.create.id
    post_id PostFactory.create.id
  end
end
