class BatchLog < ApplicationRecord
    belongs_to :batch, optional: true
    belongs_to :stream
    belongs_to :stage
    belongs_to :reactor

    validates :stream, :stage, :reactor, :timestamp, presence: true

    def before_import_save record
        self.timestamp = self.timestamp.change({sec: 0}) - 330.minutes
    end
end
