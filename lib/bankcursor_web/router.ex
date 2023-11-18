defmodule BankcursorWeb.Router do
  use BankcursorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BankcursorWeb do
    pipe_through :api

    get "/", WelcomeController, :index
  end

  if Application.compile_env(:bankcursor, :dev_routes) do

    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BankcursorWeb.Telemetry
    end
  end
end
