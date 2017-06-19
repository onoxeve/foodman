class ChangeNameAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :name, :string, null: false, default: ""
    change_column :users, :admin, :boolean, null: false
  end
end
