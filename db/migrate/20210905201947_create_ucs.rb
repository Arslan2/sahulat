class CreateUcs < ActiveRecord::Migration
  def change
    create_table :ucs do |t|

    	t.string :name, default: ""
    	t.string :session_type, default: "Fixed Station"
    	t.date :last_visit_date
    	t.string :last_visit_by, default: ""
    	t.boolean :already_visit, default: false
        t.references :tehsil, index: true

        t.timestamps null: false
    end
  end
end
