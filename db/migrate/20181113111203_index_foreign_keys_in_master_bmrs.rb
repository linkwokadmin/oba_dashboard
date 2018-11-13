class IndexForeignKeysInMasterBmrs < ActiveRecord::Migration[5.2]
  def change
    add_index :master_bmrs, :product_id
    add_index :master_bmrs, :stage_id
  end
end
