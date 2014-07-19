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

$ ->
  return unless $('body').hasClass('sentences-index')
  $(".ticon" ).draggable({ addClasses: 'dragging'})
  $('.ticon-input').droppable({
    accept: ".ticon",
    drop: (event, ui) ->
      iconId = ui.draggable.data('icon-id')
      return if iconId in iconIds
      console.log "drop:#{iconId}"
      iconIds.push(iconId)
      console.log iconIds

      return unless $('body').hasClass('pages-index')
      resetSearchResult(iconIds)

    out: (event, ui) ->
      iconId = ui.draggable.data('icon-id')
      console.log "out:#{iconId}"
      window.iconIds = window.iconIds.filter (id) -> id isnt iconId
      console.log window.iconIds
      console.log iconIds

      return unless $('body').hasClass('pages-index')
      resetSearchResult(iconIds)
  })