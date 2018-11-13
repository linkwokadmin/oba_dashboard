class IndexForeignKeysInStreamReactors < ActiveRecord::Migration[5.2]
  def change
    add_index :stream_reactors, :reactor_id
    add_index :stream_reactors, :stream_id
  end
end
