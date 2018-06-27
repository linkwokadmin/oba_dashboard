class CreateStreamReactors < ActiveRecord::Migration[5.2]
    def change
        create_table :stream_reactors do |t|
            t.integer :stream_id
            t.integer :reactor_id

            t.timestamps
        end
    end
end
