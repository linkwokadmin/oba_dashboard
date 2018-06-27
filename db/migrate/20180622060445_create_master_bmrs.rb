class CreateMasterBmrs < ActiveRecord::Migration[5.2]
    def change
        create_table :master_bmrs do |t|
            t.integer :stage_id
            t.integer :product_id
            t.bigint :bct
            t.string :uuid
            t.boolean :initial, default: false

            t.timestamps
        end
    end
end
