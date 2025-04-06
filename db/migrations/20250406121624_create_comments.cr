class CreateComments::V20250406121624 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Comment) do
      primary_key id : Int64
      add_timestamps
      add content : String
      add_belongs_to author : User, on_delete: :cascade
      add_belongs_to post : Post, on_delete: :cascade
    end
  end

  def rollback
    drop table_for(Comment)
  end
end
