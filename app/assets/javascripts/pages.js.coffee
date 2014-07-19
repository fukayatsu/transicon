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
  Vue.component 'ticon',
    template: '#ticon-template'
    methods:
      select: (e) ->
        vm = e.targetVM
        return if vm.$data.icon in vm.$root.selectedIcons
        return if vm.$root.selectedIcons.length >= 4
        vm.$root.selectedIcons.push vm.$data.icon
        iconIds = (icon.id for icon in vm.$root.selectedIcons)
        resetSearchResult(iconIds)
      delete: (e) ->
        vm = e.targetVM
        index = vm.$root.selectedIcons.indexOf(vm.$data.icon)
        vm.$root.selectedIcons.splice(index, 1)
        iconIds = (icon.id for icon in vm.$root.selectedIcons)
        resetSearchResult(iconIds)

  vue = new Vue
    el: '#vue'
    data:
      icons: []
      selectedIcons: []
  $.get '/icons.json', (data) ->
    vue.$data.icons = data.icons
