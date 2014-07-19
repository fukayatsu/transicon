window.iconIds = []

resetSearchResult = (iconIds) ->
  $.post '/sentences/search', { icons:  iconIds }, (html) ->
    $('#search-result').html(html)

$(document).on 'click', '.btn-listen', (e) ->
  text = $(e.target).data('text')
  $audio = $('<audio>')
  $audio.attr('src', "https://translate.google.com/translate_tts?tl=en&q=#{text}")
  $audio.attr('autoplay', 'autoplay')

$ ->
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
