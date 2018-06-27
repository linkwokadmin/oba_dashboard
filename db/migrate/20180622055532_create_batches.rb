class CreateBatches < ActiveRecord::Migration[5.2]
    def change
        create_table :batches do |t|
            t.integer :product_id
            t.string :uuid
            t.bigint :batch_number

            t.timestamps
        end
    end
end
