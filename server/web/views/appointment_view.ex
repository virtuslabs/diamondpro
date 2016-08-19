defmodule Server.AppointmentView do
  use Server.Web, :view

  def render("index.json", %{appointments: appointments}) do
    %{appointments: render_many(appointments, Server.AppointmentView, "appointment.json")}
  end

  def render("show.json", %{appointment: appointment}) do
    %{appointment: render_one(appointment, Server.AppointmentView, "appointment.json")}
  end

  def render("appointment.json", %{appointment: appointment}) do
    %{id: appointment.id,
      date: appointment.date,
      time: appointment.time,
      client: render_one(appointment.client, Server.ClientView, "client.json"),
      package: render_one(appointment.package, Server.PackageView, "package.json")
    }

  end
end
