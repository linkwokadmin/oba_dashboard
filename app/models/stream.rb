class Stream < ApplicationRecord
    STREAM_1 = 'Stream 1'.freeze
    STREAM_2 = 'Stream 2'.freeze
    STREAM_3 = 'Stream 3'.freeze
    STREAM_4 = 'Stream 4'.freeze
    STREAMS = [STREAM_1, STREAM_2, STREAM_3, STREAM_4].freeze

    has_many :stream_reactors, dependent: :destroy
    has_many :stream_products, dependent: :destroy
    has_many :reactors, -> {distinct}, through: :stream_reactors
    has_many :products, -> {distinct}, through: :stream_products
    has_many :batch_logs
end
