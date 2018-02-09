class TripSerializer < ActiveModel::Serializer
  attributes :id, :start_address, :destination_address, :price, :date
end
