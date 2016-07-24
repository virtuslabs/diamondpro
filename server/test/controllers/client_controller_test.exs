defmodule Server.ClientControllerTest do
  use Server.ConnCase

  alias Server.Client
  @valid_attrs %{first_name: "some content", last_name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, client_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    client = Repo.insert! %Client{}
    conn = get conn, client_path(conn, :show, client)
    assert json_response(conn, 200)["data"] == %{"id" => client.id,
      "last_name" => client.last_name,
      "first_name" => client.first_name}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, client_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, client_path(conn, :create), client: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Client, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, client_path(conn, :create), client: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    client = Repo.insert! %Client{}
    conn = put conn, client_path(conn, :update, client), client: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Client, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    client = Repo.insert! %Client{}
    conn = put conn, client_path(conn, :update, client), client: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    client = Repo.insert! %Client{}
    conn = delete conn, client_path(conn, :delete, client)
    assert response(conn, 204)
    refute Repo.get(Client, client.id)
  end
end
