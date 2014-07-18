window.iconIds = []

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
      $.post '/sentences/search', { icons:  iconIds }, (sentences) ->
        html = '<ul>'
        for sentence in sentences
          html += '<li>' + sentence.body_en
          html += '<audio src="http://translate.google.com/translate_tts?tl=en&q=' + sentence.body_en.split(' ').join('+') + '" controls></audio>'
        html += '</ul>'
        $('#search-result').html(html)
    out: (event, ui) ->
      iconId = ui.draggable.data('icon-id')
      console.log "out:#{iconId}"
      iconIds = iconIds.filter (id) -> id isnt iconId
      console.log iconIds
  })
