root = global ? window

window.initialize = ->

  root.renderFullCalendar()

  if $('html').hasClass('no-touch')
    datetimeFields = $('input[type=datetime-local]')
    dateFields = $('input[type=date]')

    if datetimeFields.length > 0 || dateFields.length > 0
      datetimeFields.attr('type','text')
      datetimeFields.datetimepicker
        format: 'Y-m-d H:i'

      dateFields.attr('type','text')
      dateFields.datetimepicker
        timepicker: false,
        format: 'Y-m-d'

