class Post < BaseModel
  table do
    column title : String
    column content : String
    column published_at : Time

    belongs_to author : User
  end
end
