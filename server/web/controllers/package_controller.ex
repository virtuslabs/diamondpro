defmodule Server.PackageController do
  use Server.Web, :controller

  alias Server.Package

  def index(conn, %{"package_type" => package_type}) do
    packages = Repo.all(from p in Package, where: p.package_type == ^package_type) |> Repo.preload([:appointment])
    IO.inspect(packages)
    render(conn, "index.json", packages: packages)
  end

  def index(conn, params) do
    packages = Repo.all(Package)  |> Repo.preload([:appointment])
    render(conn, "index.json", packages: packages)
  end

  def create(conn, %{"package" => package_params}) do
    changeset = Package.changeset(%Package{}, package_params)

    case Repo.insert(changeset) do
      {:ok, package} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", package_path(conn, :show, package))
        |> render("show.json", package: package)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Server.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    package = Repo.get!(Package, id) |> Repo.preload([:appointment])
    render(conn, "show.json", package: package)
  end


  def update(conn, %{"id" => id, "package" => package_params}) do
    package = Repo.get!(Package, id)
    changeset = Package.changeset(package, package_params)

    case Repo.update(changeset) do
      {:ok, package} ->
        render(conn, "show.json", package: package)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Server.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    package = Repo.get!(Package, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(package)

    send_resp(conn, :no_content, "")
  end
end
