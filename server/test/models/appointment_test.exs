defmodule Server.AppointmentTest do
  use Server.ModelCase

  alias Server.Appointment

  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, time: %{hour: 14, min: 0, sec: 0}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Appointment.changeset(%Appointment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Appointment.changeset(%Appointment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
