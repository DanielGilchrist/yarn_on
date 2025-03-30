class CreatePosts::V20250330163913 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Post) do
      primary_key id : Int64
      add_timestamps
      add_belongs_to author : User, on_delete: :cascade
      add title : String
      add content : String
      add published_at : Time
    end
  end

  def rollback
    drop table_for(Post)
  end
end
