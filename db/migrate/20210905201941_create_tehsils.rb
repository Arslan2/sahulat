class CreateTehsils < ActiveRecord::Migration
  def change
    create_table :tehsils do |t|

      t.string :name
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
