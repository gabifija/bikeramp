class TripsDailyPresenter < Presenter
  def as_json(*)
    {
      day: convert_date(@object.date),
      total_distance: convert_distance(@object.sum_distance),
      avg_ride: convert_distance(@object.avg_ride),
      avg_price: convert_price(@object.avg_price)
    }
  end
end
