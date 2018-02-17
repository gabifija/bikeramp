class TripsMonthlyPresenter < Presenter
  def as_json(*)
    {
      stats: @object.map { |o| TripsDailyPresenter.new(o) }
    }
  end
end
