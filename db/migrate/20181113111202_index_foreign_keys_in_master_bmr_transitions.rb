class IndexForeignKeysInMasterBMRTransitions < ActiveRecord::Migration[5.2]
  def change
    add_index :master_bmr_transitions, :child_id
    add_index :master_bmr_transitions, :parent_id
  end
end
