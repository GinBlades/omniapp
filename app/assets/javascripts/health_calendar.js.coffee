root = global ? window

root.renderFullCalendar = ->
  if $('#fullcalendar').length > 0
    colors =
      green: '#449d44'
      grey: '#737373'
      blue: '#337ab7'

    colors.list = [colors.green, colors.grey, colors.blue]
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
