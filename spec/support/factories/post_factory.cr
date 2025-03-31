class PostFactory < Avram::Factory
  def initialize
    title "Test Title"
    content "Test content"
    author_id UserFactory.create.id
    published_at Time.local
  end
end
