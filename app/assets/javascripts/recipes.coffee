# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

    @validateForm = ->
      totalChecked = document.querySelectorAll('input[type="checkbox"]:checked').length
      if totalChecked < 2
        alert 'Você precisa selecionar pelo menos 2 ingredientes para realizar a busca.'
        return false
      if totalChecked > 20
        alert 'Você não pode selecionar mais do que 20 ingredientes para realizar a busca!'
        return false
      return