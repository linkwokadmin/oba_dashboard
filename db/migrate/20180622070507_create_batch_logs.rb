class CreateBatchLogs < ActiveRecord::Migration[5.2]
    def change
        create_table :batch_logs do |t|
            t.integer :batch_id
            t.integer :stream_id
            t.integer :stage_id
            t.integer :reactor_id
            t.datetime :timestamp
            t.decimal :reactor_weight, precision: 10, scale: 2
            t.decimal :reactor_level, precision: 5, scale: 2
            t.decimal :reactor_ph, precision: 5, scale: 2
            t.decimal :internal_temperature, precision: 7, scale: 2
            t.decimal :internal_ph, precision: 5, scale: 2

            t.timestamps
        end
    end
end
