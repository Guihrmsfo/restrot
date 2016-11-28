# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
    
@favorite = (recipe_id) ->
    $('#fav-link'+recipe_id).hide()
    $('#unfav-link'+recipe_id).show()

@unfavorite = (recipe_id) ->
    $('#fav-link'+recipe_id).show()
    $('#unfav-link'+recipe_id).hide()