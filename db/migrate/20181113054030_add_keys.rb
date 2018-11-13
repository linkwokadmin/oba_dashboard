class AddKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id", name: "active_storage_attachments_blob_id_fk"
    add_foreign_key "batch_logs", "batches", name: "batch_logs_batch_id_fk"
    add_foreign_key "batch_logs", "reactors", name: "batch_logs_reactor_id_fk"
    add_foreign_key "batch_logs", "stages", name: "batch_logs_stage_id_fk"
    add_foreign_key "batch_logs", "streams", name: "batch_logs_stream_id_fk"
    add_foreign_key "batches", "products", name: "batches_product_id_fk"
    add_foreign_key "master_bmr_transitions", "master_bmrs", column: "child_id", name: "master_bmr_transitions_child_id_fk"
    add_foreign_key "master_bmr_transitions", "master_bmrs", column: "parent_id", name: "master_bmr_transitions_parent_id_fk"
    add_foreign_key "master_bmrs", "products", name: "master_bmrs_product_id_fk"
    add_foreign_key "master_bmrs", "stages", name: "master_bmrs_stage_id_fk"
    add_foreign_key "reactors", "stages", name: "reactors_stage_id_fk"
    add_foreign_key "stream_products", "products", name: "stream_products_product_id_fk"
    add_foreign_key "stream_products", "streams", name: "stream_products_stream_id_fk"
    add_foreign_key "stream_reactors", "reactors", name: "stream_reactors_reactor_id_fk"
    add_foreign_key "stream_reactors", "streams", name: "stream_reactors_stream_id_fk"
  end
end
