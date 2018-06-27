class Batch < ApplicationRecord
    belongs_to :product, optional: true
    has_many :batch_logs

    before_save :parse_name

    validates :name, presence: true, uniqueness: true
    validates :batch_number, uniqueness: {scope: :product}

    private

        def parse_name
            batch_data = self.name.split '#'
            self.product = Product.find_by name: batch_data[0]
            self.batch_number = batch_data[1].to_i
        rescue
        end
end
