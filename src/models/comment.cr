class Comment < BaseModel
  table do
    column content : String

    belongs_to author : User
    belongs_to post : Post
  end

  def author_name : String
    author.full_name
  end

  def pretty_created_at : String
    created_at.to_s("%b %d, %Y at %I:%M %p")
  end
end
