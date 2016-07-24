defmodule Server.PackageView do
  use Server.Web, :view

  def render("index.json", %{packages: packages}) do
    %{packages: render_many(packages, Server.PackageView, "package.json")}
  end

  def render("show.json", %{package: package}) do
    %{package: render_one(package, Server.PackageView, "package.json")}
  end

  def render("package.json", %{package: package}) do
    %{id: package.id,
      title: package.title,
      description: package.description,
      price: package.price}
  end
end
