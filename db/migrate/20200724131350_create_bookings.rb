class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.string :service, null: false, default: ""
      t.text :address, null: false, default: ""
      t.timestamps null: false
    end
  end
end
