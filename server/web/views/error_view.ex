defmodule Server.ErrorView do
  use Server.Web, :view
  use JaSerializer.PhoenixView

  def render("401.json", _assigns) do
    %{title: "Unauthorized", code: 401}
    |> JaSerializer.ErrorSerializer.format
  end

  def render("500.json", _assigns) do
    %{title: "Internal Server Error", code: 500}
    |> JaSerializer.ErrorSerializer.format
  end

  def render("404.json", _assigns) do
    %{title: "Not Found", code: 404}
    |> JaSerializer.ErrorSerializer.format
  end

  # # In case no render clause matches or no
  # # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "404.json", assigns
  end
end
