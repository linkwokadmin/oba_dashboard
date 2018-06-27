class MasterBMR < ApplicationRecord
    belongs_to :stage
    belongs_to :product
    has_many :parent_transitions, class_name: 'MasterBMRTransition', foreign_key: :child_id, dependent: :destroy
    has_many :child_transitions, class_name: 'MasterBMRTransition', foreign_key: :parent_id, dependent: :destroy
    has_many :parents, -> {distinct}, through: :parent_transitions, source: :parent
    has_many :children, -> {distinct}, through: :child_transitions, source: :child

    attr_accessor :name

    after_find :set_attributes

    private

        def set_attributes
            @name = "#{self.product.name}: #{self.stage.name}" rescue ''
        end
end
