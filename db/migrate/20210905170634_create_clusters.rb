class CreateClusters < ActiveRecord::Migration
  def change
    create_table :clusters do |t|

      t.json :data
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
