defmodule Server.AppointmentControllerTest do
  use Server.ConnCase

  alias Server.Appointment
  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, time: %{hour: 14, min: 0, sec: 0}}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, appointment_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    appointment = Repo.insert! %Appointment{}
    conn = get conn, appointment_path(conn, :show, appointment)
    assert json_response(conn, 200)["data"] == %{"id" => appointment.id,
      "date" => appointment.date,
      "time" => appointment.time}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, appointment_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, appointment_path(conn, :create), appointment: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Appointment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, appointment_path(conn, :create), appointment: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    appointment = Repo.insert! %Appointment{}
    conn = put conn, appointment_path(conn, :update, appointment), appointment: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Appointment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    appointment = Repo.insert! %Appointment{}
    conn = put conn, appointment_path(conn, :update, appointment), appointment: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    appointment = Repo.insert! %Appointment{}
    conn = delete conn, appointment_path(conn, :delete, appointment)
    assert response(conn, 204)
    refute Repo.get(Appointment, appointment.id)
  end
end
