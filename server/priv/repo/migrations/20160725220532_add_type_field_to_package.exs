defmodule Server.Repo.Migrations.AddTypeFieldToPackage do
  use Ecto.Migration

  def change do
    alter table(:packages) do
      add :package_type, :string
    end
  end
end
