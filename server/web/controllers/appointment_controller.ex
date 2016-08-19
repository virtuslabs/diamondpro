defmodule Server.AppointmentController do
  use Server.Web, :controller

  alias Server.Appointment

  def index(conn, _params) do
    appointments = Repo.all(Appointment) |> Repo.preload([:client, :package])
    render(conn, "index.json", appointments: appointments)
  end

  def create(conn, %{"appointment" => appointment_params}) do
    changeset = Appointment.changeset(%Appointment{}, appointment_params)

    case Repo.insert(changeset) do
      {:ok, appointment} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", appointment_path(conn, :show, appointment))
        |> render("show.json", appointment: appointment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Server.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    appointment = Repo.get!(Appointment, id) |> Repo.preload([:client, :package])
    IO.inspect(appointment)
    render(conn, "show.json", appointment: appointment)
  end

  def update(conn, %{"id" => id, "appointment" => appointment_params}) do
    appointment = Repo.get!(Appointment, id)
    changeset = Appointment.changeset(appointment, appointment_params)

    case Repo.update(changeset) do
      {:ok, appointment} ->
        render(conn, "show.json", appointment: appointment)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Server.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    appointment = Repo.get!(Appointment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(appointment)

    send_resp(conn, :no_content, "")
  end
end
