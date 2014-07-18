iconIds = []

$ ->
  $(".ticon" ).draggable({ addClasses: 'dragging'})
  $('.ticon-input').droppable({
    accept: ".ticon",
    drop: (event, ui) ->
      iconId = ui.draggable.data('icon-id')
      console.log "drop:#{iconId}"
      iconIds.push(iconId)
      console.log iconIds
    out: (event, ui) ->
      iconId = ui.draggable.data('icon-id')
      console.log "out:#{iconId}"
      iconIds = iconIds.filter (id) -> id isnt iconId
      console.log iconIds
  })
