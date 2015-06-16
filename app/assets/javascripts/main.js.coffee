root = global ? window

root.startSpinner = ->
  $('div#spinner').css('display', 'block')
root.stopSpinner = ->
  $('div#spinner').css('display', 'none')

root.initialize = ->

  root.renderFullCalendar()

  # Date/Time Picker for Desktop vs. Mobile
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

  # Ace editor for notes
  textarea = $('textarea#notes_entry_body').hide()
  if textarea.length > 0
    editor = ace.edit('notes_entry_editor')
    editor.setTheme('ace/theme/github')
    editor.getSession().setMode('ace/mode/markdown')
    editor.getSession().setValue(textarea.val())
    editor.getSession().on 'change', ->
      textarea.val(editor.getSession().getValue())

  # Autocomplete for budget entries
  subcategoryInput = $('#budget_entry_budget_subcategory')
  if subcategoryInput.length > 0
    subcategoryId = $('#budget_entry_budget_subcategory_id')

    $.getJSON '/admin/budget/subcategories.json', (data) ->
      labels = []
      $.each data, (idx, obj) ->
        labels.push
          label: obj.label
          value: obj.id
      subcategoryInput.autocomplete
        source: labels
        select: (event, ui) ->
          event.preventDefault()
          subcategoryInput.val ui.item.label
          subcategoryId.val ui.item.value
    
  # Task list updater
  taskList = $('#task-list')
  if taskList.length
    successValue = $('td#success')
    console.log successValue.text()
    locationParts = window.location.href.split('/')
    lastIndex = locationParts.length - 1
    recordNumber = locationParts[lastIndex]
    taskList.find('input').on 'click', (e) ->
      task = @.name
      completed = @.checked
      $.ajax
        type: 'PUT'
        url: "/admin/points/daily_tasks/#{recordNumber}/task_update"
        data:
          task: task
          completed: completed
      .done (msg) ->
        successValue.text("#{msg}%")
        
