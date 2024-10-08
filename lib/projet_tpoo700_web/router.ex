defmodule ProjetTpoo700Web.Router do
  use ProjetTpoo700Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ProjetTpoo700Web.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ProjetTpoo700Web do
    pipe_through :api

    get "/user", UserController, :index
    get "/user/:id", UserController, :show
    post "/user", UserController, :create
    put "/user/:id", UserController, :update
    patch "/user/:id", UserController, :update
    delete "/user/:id", UserController, :delete

    # Routes pour Tasks
    get "/task", TaskController, :index
    get "/task/:id", TaskController, :show
    post "/task", TaskController, :create
    put "/task/:id", TaskController, :update
    patch "/task/:id", TaskController, :update
    delete "/task/:id", TaskController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", ProjetTpoo700Web do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:projet_tpoo700, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ProjetTpoo700Web.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
