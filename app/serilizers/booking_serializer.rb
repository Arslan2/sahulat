class BookingSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :service, :address, :created_at
end
