$ ->
  $('#form')
    .on 'ajax:complete', (event) ->
      response = event.detail[0].response
      $('#result').html(response)