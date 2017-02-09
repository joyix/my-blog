class FixUsers < ActiveRecord::Migration[5.0]
  change_table :users do |t|
    t.remove :admin, :boolean
    t.boolean :admin
  end

end
