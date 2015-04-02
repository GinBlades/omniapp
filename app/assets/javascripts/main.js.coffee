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

  textarea = $('textarea#notes_entry_body').hide()
  if textarea.length > 0
    editor = ace.edit('notes_entry_editor')
    editor.setTheme('ace/theme/github')
    editor.getSession().setMode('ace/mode/markdown')
    editor.getSession().setValue(textarea.val())
    editor.getSession().on 'change', ->
      textarea.val(editor.getSession().getValue())

