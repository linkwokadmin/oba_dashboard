class CreateProducts < ActiveRecord::Migration[5.2]
    def change
        create_table :products do |t|
            t.string :item_code
            t.string :name
            t.decimal :batch_size, precision: 7, scale: 2
            t.string :uuid

            t.timestamps
        end
    end
end
