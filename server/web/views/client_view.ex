defmodule Server.ClientView do
  use Server.Web, :view

  def render("index.json", %{clients: clients}) do
    %{clients: render_many(clients, Server.ClientView, "client.json")}
  end

  def render("show.json", %{client: client}) do
    %{client: render_one(client, Server.ClientView, "client.json")}
  end

  def render("client.json", %{client: client}) do
    %{id: client.id,
      last_name: client.last_name,
      first_name: client.first_name}
  end
end
