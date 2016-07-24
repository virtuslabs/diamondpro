defmodule Server.Repo.Migrations.Appointmentshavepackages do
  use Ecto.Migration

  def change do
    alter table(:appointments) do
      add :package_id, references(:packages)
    end
  end
end
