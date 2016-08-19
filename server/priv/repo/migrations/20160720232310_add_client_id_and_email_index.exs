defmodule Server.Repo.Migrations.AddClientIdAndEmailIndex do
  use Ecto.Migration

  def change do
    create index(:clients, [:id], unique: true)
    create index(:clients, [:email], unique: true)
  end
end
