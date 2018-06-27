class Product < ApplicationRecord
    has_many :stream_products, dependent: :destroy
    has_many :streams, -> {distinct}, through: :stream_products
    has_many :master_bmrs
    has_many :batches, dependent: :destroy
end
