class IndexForeignKeysInReactors < ActiveRecord::Migration[5.2]
  def change
    add_index :reactors, :stage_id
  end
end
