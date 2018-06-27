module ApplicationHelper
    def bootstrap_class_for(flash_type)
        case flash_type.to_sym
            when :success
                'success'
            when :error
                'error'
            when :alert
                'warning'
            else
                'info'
        end
    end
end
