module DashboardsHelper
    def delay_view_class_for delay
        if delay.present?
            if delay <= 0
                'bg-success'
            elsif delay <= 7200
                'bg-warning'
            else
                'bg-danger'
            end
        else
            ''
        end
    end
end
