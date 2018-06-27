class MasterBMRTransition < ApplicationRecord
    belongs_to :parent, class_name: 'MasterBMR', foreign_key: :parent_id
    belongs_to :child, class_name: 'MasterBMR', foreign_key: :child_id
end
