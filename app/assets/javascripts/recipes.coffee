# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('button[id^=btnRecipe]').on 'click', ->
  uri = $('#modal'+$(this).data('indice')).data 'uri'
  console.log(uri)
  $.post '/recipes/view',
    uri: uri
    
@favorite = (recipe_id) ->
    $('#fav-link'+recipe_id).hide()
    $('#unfav-link'+recipe_id).show()

@unfavorite = (recipe_id) ->
    $('#fav-link'+recipe_id).show()
    $('#unfav-link'+recipe_id).hide()

@validateForm = ->
  totalChecked = document.querySelectorAll('input[type="checkbox"]:checked').length
  if totalChecked < 2
    alert 'Você precisa selecionar pelo menos 2 ingredientes para realizar a busca.'
    return false
  if totalChecked > 20
    alert 'Você não pode selecionar mais do que 20 ingredientes para realizar a busca!'
    return false
  return
