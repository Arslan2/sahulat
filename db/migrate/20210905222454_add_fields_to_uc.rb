class AddFieldsToUc < ActiveRecord::Migration
  def change
    add_column :ucs, :vaccinator_name, :string, default: ""
    add_column :ucs, :health_facility_name, :string, default: ""
  end
end