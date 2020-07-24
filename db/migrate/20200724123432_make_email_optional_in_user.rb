class MakeEmailOptionalInUser < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, null: true, index: false
    remove_index :users, :email
  end
end
