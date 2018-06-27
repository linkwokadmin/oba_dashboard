class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    after_initialize :set_uuid

    protected

        def set_uuid
            self.uuid ||= SecureRandom.hex 12 if self.has_attribute? :uuid
        end
end
