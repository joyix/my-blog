class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :string
    add_column :users, :boolean, :string
  end
end
