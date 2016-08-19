defmodule Server.Repo.Migrations.Clientshaveappointments do
  use Ecto.Migration

  def change do
    alter table(:appointments) do
      add :client_id, references(:clients)
    end
  end
end
