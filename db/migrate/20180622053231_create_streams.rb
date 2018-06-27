class CreateStreams < ActiveRecord::Migration[5.2]
    def change
        create_table :streams do |t|
            t.string :name
            t.string :uuid

            t.timestamps
        end
    end
end
