root = exports ? this

root.startSpinner = ->
  $('div#spinner').css('display', 'block')
root.stopSpinner = ->
  $('div#spinner').css('display', 'none')

root.initialize = ->
  root.angular.bootstrap("body", ["Games", "Notes", "WorkTimer"])
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

  # Autocomplete for allowance categories
  allowancePayeeInput = $("#allowance_entry_payee")
  if allowancePayeeInput.length
    allowanceCategoryInput = $("#allowance_entry_category")
    $.getJSON "/admin/allowance/autocompleter.json", (data) ->
      allowancePayeeInput.autocomplete
        source: data.payees
      allowanceCategoryInput.autocomplete
        source: data.categories
    
  # Task list updater
  taskList = $('#task-list')
  if taskList.length
    successValue = $('td#success')
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
        
  # Allowance task updater
  allowanceTaskForm = $(".edit_allowance_task")
  if allowanceTaskForm.length > 0
    days = []
    allowanceTaskForm.find("input[type=checkbox]").each (index, box) ->
      if $(box).prop("checked")
        days.push $(box).val()
      $(box).closest("label").on "click", (event) ->
        input = $(@).find("input")
        checked = input.prop("checked")
        if checked
          if days.indexOf(input.val()) < 0
            days.push(input.val())
        else
          index = days.indexOf(input.val())
          days.splice(index, 1)

        $.ajax
          type: "PUT"
          url: allowanceTaskForm.prop("action")
          dataType: "json"
          data:
            allowance_task:
              days: days
          success: ->
            if days.length == 7
              window.location = "/admin/allowance"
