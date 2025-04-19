class SaveComment < Comment::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/saving-records#perma-permitting-columns
  permit_columns content
  needs current_user : User
  needs post : Post

  before_save do
    validate_size_of content, min: 1, max: 3000

    author_id.value = current_user.id
    post_id.value = post.id
  end
end
