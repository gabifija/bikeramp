class Presenter
  def initialize(object)
    @object = object
  end

  def as_json
    raise 'as_json called on parent.'
  end

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end

  def convert_distance(object)
    helper.number_to_human(object, units: {unit: "km"})
  end

  def convert_price(object)
    helper.number_to_human(object, units: {unit: "PLN"})
  end

  def convert_date(object)
    object.to_time.strftime("%b, #{object.day.ordinalize}")
  end
end
