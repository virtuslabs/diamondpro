defmodule Server.Repo.Migrations.CreateAppointment do
  use Ecto.Migration

  def change do
    create table(:appointments) do
      add :date, :date
      add :time, :time

      timestamps()
    end

  end
end
