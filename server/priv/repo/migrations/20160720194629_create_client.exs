defmodule Server.Repo.Migrations.CreateClient do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :last_name, :string
      add :first_name, :string

      timestamps()
    end

  end
end
