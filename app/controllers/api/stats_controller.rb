class API::StatsController < ApplicationController
  def get_weekly_stats
    render json: {}
  end

  def get_monthly_stats
    render json: {}
  end

  private
    def set_stat
      @stat = Stat.find(params[:id])
    end

    def stat_params
      params.permit(:distance)
    end
end
