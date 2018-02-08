Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :trips, only: [:index, :create] do
        get 'stats/weekly', on: :collection, controller: "stats", action: "get_weekly_stats"
        get 'stats/monthly', on: :collection, controller: "stats", action: "get_monthly_stats"
    end
  end
end
