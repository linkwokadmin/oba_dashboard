class IndexForeignKeysInBatches < ActiveRecord::Migration[5.2]
  def change
    add_index :batches, :product_id
  end
end
