Rails.application.routes.draw do
  resources :stats
  namespace :api, defaults: {format: :json} do
    resources :trips do
        get 'stats/weekly', on: :collection, controller: "stats", action: "show_weekly"
        get 'stats/monthly', on: :collection, controller: "stats", action: "show_monthly"
    end
  end
end
