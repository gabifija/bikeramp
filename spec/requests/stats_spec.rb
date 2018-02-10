require 'rails_helper'

RSpec.describe "Stats", type: :request do
  describe "GET /stats/weekly" do
    it "works! (now write some real specs)" do
      get stats_weekly_api_trips_path
      expect(response).to have_http_status(200)
    end
  end
end
