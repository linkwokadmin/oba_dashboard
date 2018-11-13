class IndexForeignKeysInStreamProducts < ActiveRecord::Migration[5.2]
  def change
    add_index :stream_products, :product_id
    add_index :stream_products, :stream_id
  end
end
