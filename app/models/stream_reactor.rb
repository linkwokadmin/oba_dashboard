class StreamReactor < ApplicationRecord
    STREAM_REACTORS = {
        Stream::STREAM_1 => %w[T-1101 R-1101 R-1105 R-1110],
        Stream::STREAM_2 => %w[T-1101 R-1102 R-1106 R-1109],
        Stream::STREAM_3 => %w[T-1102 R-1103 R-1107],
        Stream::STREAM_4 => %w[T-1102 R-1104 R-1108 R-1111]
    }.freeze

    belongs_to :stream
    belongs_to :reactor
end
