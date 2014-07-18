$(document).on 'click', '#create_sentence', ->
  sentence =
    body_ja: $('#body_ja').val()
    body_en: $('#body_en').val()
  $.ajax
    url: '/sentences',
    type: 'POST'
    data:
      sentence: sentence
      icons: iconIds.join(',')
    timeout: 10000
    beforeSend: ->
    complete: ->
    success: (result, textStatus, xhr) ->
      alert 'success'
      location.href = ''
    error: (xhr, textStatus, error) ->
      alert 'error'
