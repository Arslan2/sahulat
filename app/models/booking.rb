class Booking < ActiveRecord::Base
  validates :name, :phone, :service, :address, presence: true
end
