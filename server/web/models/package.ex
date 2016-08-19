defmodule Server.Package do
  use Server.Web, :model

  schema "packages" do
    field :title, :string
    field :description, :string
    field :price, :decimal
    field :package_type, :string
    belongs_to :appointment, Server.Appointment

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :price, :package_type])
    |> validate_required([:title, :description, :price, :package_type])
  end
end
