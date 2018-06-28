class Stage < ApplicationRecord
    STAGE_CC = 'CC PREPARATION'.freeze
    STAGE_I = '1st CONDENSATION'.freeze
    STAGE_II_N_III = '2nd 3rd CONDENSATION'.freeze
    STAGES = [STAGE_CC, STAGE_I, STAGE_II_N_III].freeze
    REACTORS = {
        STAGE_CC => %w[T-1101 T-1102],
        STAGE_I => %w[R-1101 R-1102 R-1103 R-1104],
        STAGE_II_N_III => %w[R-1105 R-1106 R-1107 R-1108 R-1109 R-1110 R-1111]
    }.freeze

    has_many :reactors, dependent: :destroy
    has_many :master_bmrs
    has_many :batch_logs

    def name_short
        self.name[/(.*)\s/,1].strip
    end
end
