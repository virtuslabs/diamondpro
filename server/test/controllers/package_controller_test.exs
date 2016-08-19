defmodule Server.PackageControllerTest do
  use Server.ConnCase

  alias Server.Package
  @valid_attrs %{description: "some content", price: "120.5", title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, package_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    package = Repo.insert! %Package{}
    conn = get conn, package_path(conn, :show, package)
    assert json_response(conn, 200)["data"] == %{"id" => package.id,
      "title" => package.title,
      "description" => package.description,
      "price" => package.price,
      "appointment_id" => package.appointment_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, package_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, package_path(conn, :create), package: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Package, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, package_path(conn, :create), package: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    package = Repo.insert! %Package{}
    conn = put conn, package_path(conn, :update, package), package: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Package, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    package = Repo.insert! %Package{}
    conn = put conn, package_path(conn, :update, package), package: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    package = Repo.insert! %Package{}
    conn = delete conn, package_path(conn, :delete, package)
    assert response(conn, 204)
    refute Repo.get(Package, package.id)
  end
end
