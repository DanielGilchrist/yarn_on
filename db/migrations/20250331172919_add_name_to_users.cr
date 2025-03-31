class AddNameToUsers::V20250331172919 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(User) do
      add first_name : String, fill_existing_with: "Big"
      add last_name : String, fill_existing_with: "Chungus"
    end
  end

  def rollback
    alter table_for(User) do
      remove :name
    end
  end
end
