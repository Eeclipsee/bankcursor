defmodule BankcursorWeb.Router do
  use BankcursorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug BankcursorWeb.Plugs.Auth
  end

  scope "/api", BankcursorWeb do
    pipe_through :api

    get "/", WelcomeController, :index

    resources "/users", UsersController, only: [:create]
    post "/users/login", UsersController, :login
  end

  scope "/api", BankcursorWeb do
    pipe_through [:api, :auth]


    resources "/users", UsersController, only: [:update, :delete, :show]
    post "/accounts", AccountsController, :create
    post "/accounts/transactions", AccountsController, :transaction
  end

  if Application.compile_env(:bankcursor, :dev_routes) do

    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BankcursorWeb.Telemetry
    end
  end
end
