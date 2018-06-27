class CreateReactors < ActiveRecord::Migration[5.2]
    def change
        create_table :reactors do |t|
            t.string :label
            t.integer :stage_id
            t.string :uuid

            t.timestamps
        end
    end
end
