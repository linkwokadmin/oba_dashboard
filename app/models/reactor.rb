class Reactor < ApplicationRecord
    REACTORS = %w[T-1101 T-1102 R-1101 R-1102 R-1103 R-1104 R-1105 R-1106 R-1107 R-1108 R-1109 R-1110 R-1111].freeze

    belongs_to :stage
    has_many :stream_reactors, dependent: :destroy
    has_many :stream, -> {distinct}, through: :stream_reactors
    has_many :batch_logs

    attr_accessor :name

    after_find :set_attributes

    private

        def set_attributes
            @name = self.label rescue ''
        end
end
