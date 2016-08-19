defmodule Server.Appointment do
  use Server.Web, :model

  schema "appointments" do
    field :date, Ecto.Date
    field :time, Ecto.Time
    # field :client_id, :integer
    has_one :package, Server.Package
    belongs_to :client, Server.Client
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:date, :time, :client_id])
    |> validate_required([:date, :time])
  end
end
