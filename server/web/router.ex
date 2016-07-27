defmodule Server.Router do
  use Server.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  pipeline :admin do

  end

  scope "/", Server do
    pipe_through :browser # Use the default browser stack

    get "/", IndexController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Server do
    pipe_through :api

    resources "/clients", ClientController, only: [:index, :show] do
      resources "/appointments", AppointmentController, only: [:index, :show] do
        resources "/packages", PackageController, only: [:index, :show]
      end
    end
    resources "/appointments", AppointmentController, only: [:index, :show] do
      resources "/packages", PackageController, only: [:index, :show]
    end
    resources "/packages", PackageController, only: [:index, :show]
  end

  scope "/api/admin", Server, as: :admin do
    pipe_through :api

    resources "/clients", ClientController do
      resources "/appointments", AppointmentController do
        resources "/packages", PackageController
      end
    end
    resources "/appointments", AppointmentController do
      resources "/packages", PackageController
    end
    resources "/packages", PackageController
  end
end
