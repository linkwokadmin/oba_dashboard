class IndexForeignKeysInBatchLogs < ActiveRecord::Migration[5.2]
  def change
    add_index :batch_logs, :batch_id
    add_index :batch_logs, :reactor_id
    add_index :batch_logs, :stage_id
    add_index :batch_logs, :stream_id
  end
end
