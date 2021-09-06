class CreateMasterPlans < ActiveRecord::Migration
  def change
    create_table :master_plans do |t|

    	t.string :name, default: ""
    	t.integer :percent, default: 0
    	t.date :plan_date
    	t.boolean :already_visit, default: false
        t.references :uc, index: true

      t.timestamps null: false
    end
  end
end