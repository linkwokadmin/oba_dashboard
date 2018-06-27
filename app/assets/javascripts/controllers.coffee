#= require rails-ujs
#= require dashboards
#= require streams
#= require_self

$(document).ready ->
    $.fn.select2.defaults.set 'theme', 'bootstrap'
    $.fn.select2.defaults.set 'containerCssClass', ':all:'

    $('select.default-select2').select2()

    $('.rippler').rippler
        effectClass: 'rippler-effect'
        effectSize: 0
        addElement: 'div'
        duration: 400