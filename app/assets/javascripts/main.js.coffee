
colors =
  green: '#449d44'
  grey: '#737373'
  blue: '#337ab7'

colors.list = [colors.green, colors.grey, colors.blue]

window.initialize = ->
  events = []
  $.getJSON '/admin/health/workouts.json', (data) ->
    $.each data, (idx, obj) ->
      events.push
        title: obj.name
        url: obj.url
        start: obj.start
        end: obj.finish
        color: colors.list[0]
  .done ->
    $.getJSON '/admin/health/entries.json', (data) ->
      $.each data, (idx, obj) ->
        events.push
          title: obj.name
          url: obj.url
          start: obj.entry_date
          color: colors.list[1]
    .done ->
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

