class Comment < BaseModel
  table do
    column content : String

    belongs_to author : User
    belongs_to post : Post
  end

  def author_name : String
    author.full_name
  end
end
