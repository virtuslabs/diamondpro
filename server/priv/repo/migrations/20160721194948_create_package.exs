defmodule Server.Repo.Migrations.CreatePackage do
  use Ecto.Migration

  def change do
    create table(:packages) do
      add :title, :string
      add :description, :string
      add :price, :decimal
      add :appointment_id, references(:appointments, on_delete: :nothing)

      timestamps()
    end
    create index(:packages, [:appointment_id])

  end
end
