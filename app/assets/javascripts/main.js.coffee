window.initialize = ->
  $.getJSON '/admin/health/workouts.json', (data) ->
    events = []
    $.each data, (idx, obj) ->
      events.push
        title: obj.name
        url: obj.url
        start: obj.start
        end: obj.finish
    $('#fullcalendar').fullCalendar
      header:
        left: 'prev,next today'
        center: 'title'
        right: 'month,basicWeek,basicDay'
      events: events

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

