defmodule Server.Client do
  use Server.Web, :model

  schema "clients" do
    field :last_name, :string
    field :first_name, :string
    field :email, :string

    has_many :appointments, Server.Appointment
    timestamps()
  end

  # @required_fields ~w(last_name, first_name, email)
  # @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:last_name, :first_name])
    |> validate_required([:last_name, :first_name])
    |> validate_format(:email, ~r/@/)
  end
end
