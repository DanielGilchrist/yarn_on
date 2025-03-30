class SavePost < Post::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/saving-records#perma-permitting-columns
  permit_columns title, content
  needs current_user : User

  before_save do
    author_id.value = current_user.id
    published_at.value = Time.local
  end
end
