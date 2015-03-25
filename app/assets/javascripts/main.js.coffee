window.initialize = ->
  $('.datetimepicker').datetimepicker()
  $('.datepicker').datetimepicker
    timepicker: false

  $('#add-health-rating').on 'click', (e)->
    e.preventDefault()
    $.ajax '/admin/health/ratings/new',
      success: (data) ->
        ratingForm = $(data).find('.form-inputs').html()
        $('#health-ratings').append(ratingForm)
        console.log 'Success!'
      error: ->
        console.log 'there was a problem connecting to the form.'
