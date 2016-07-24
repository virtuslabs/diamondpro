defmodule Server.Repo.Migrations.Client do
  use Ecto.Migration

  def change do
    alter table(:clients) do
      add :email, :string
    end
    create index(:clients, [:id, :email], unique: true)
  end
end
