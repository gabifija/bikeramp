class TripsDailyPresenter < Presenter
  def as_json(*)
    {
      day: convert_date(@object.date),
      total_distance: convert_distance(@object.distance),
      avg_ride: convert_distance(@object.distance),
      avg_price: convert_price(@object.price)
    }
  end
end
