Rails.application.routes.draw do
  get "/healthcheck/live", to: proc { [200, {}, %w[OK]] }
  get "/healthcheck/ready", to: GovukHealthcheck.rack_response

  # Defines the root path route ("/")
  root "home#index"

  # get "route", to: "use this controller to render#this view in the route folder"
  get "home", to: "home#index"
end
