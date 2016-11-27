# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('button[id^=btnRecipe]').on 'click', ->
  uri = $('#modal'+$(this).data('indice')).data 'uri'
  console.log(uri)
  $.post '/recipes/view',
    uri: uri