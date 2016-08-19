defmodule Server.PackageTest do
  use Server.ModelCase

  alias Server.Package

  @valid_attrs %{description: "some content", price: "120.5", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Package.changeset(%Package{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Package.changeset(%Package{}, @invalid_attrs)
    refute changeset.valid?
  end
end
