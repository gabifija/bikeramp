Rails.application.routes.draw do
  resources :stats
  namespace :api, defaults: {format: :json} do
    resources :trips do
        get 'stats/weekly', on: :collection, controller: "stats", action: "get_weekly_stats"
        get 'stats/monthly', on: :collection, controller: "stats", action: "get_monthly_stats"
    end
  end
end
