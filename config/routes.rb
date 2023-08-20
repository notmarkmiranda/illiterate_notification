Rails.application.routes.draw do
  get 'pages/home'
  # Users
  get "/sign-up", to: "users#new", as: "sign_up"
  post "/sign-up", to: "users#create"
  get "/dashboard", to: "users#show", as: "dashboard"

  # Sessions
  get "/sign-in", to: "sessions#new", as: "sign_in"
  post "/sign-in", to: "sessions#create"
  delete "/sign-out", to: "sessions#destroy", as: "sign_out"

  # Tee Times
  post "/tee-times", to: "tee_times#create", as: "tee_times"
  get "/tee-times", to: "tee_times#index"#, as: "tee_times"
end
