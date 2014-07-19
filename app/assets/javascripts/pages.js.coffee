window.iconIds = []

resetSearchResult = (iconIds) ->
  $.post '/sentences/search', { icons:  iconIds }, (html) ->
    $('#search-result').html(html)

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
