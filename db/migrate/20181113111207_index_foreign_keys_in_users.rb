class IndexForeignKeysInUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :employee_id
  end
end
