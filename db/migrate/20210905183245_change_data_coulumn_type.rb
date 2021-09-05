class ChangeDataCoulumnType < ActiveRecord::Migration
  def change
  	change_column :clusters, :data, :jsonb, null: false, default: '{}'
  end
end
