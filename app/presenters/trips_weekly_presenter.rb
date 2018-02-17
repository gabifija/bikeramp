class TripsWeeklyPresenter < Presenter
  def as_json(*)
    {
      total_distance: convert_distance(@object.pluck(:distance).sum),
      total_price: convert_price(@object.pluck(:price).sum)
    }
  end
end
