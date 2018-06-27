class CreateStreamProducts < ActiveRecord::Migration[5.2]
    def change
        create_table :stream_products do |t|
            t.integer :stream_id
            t.integer :product_id

            t.timestamps
        end
    end
end
