jQuery -> 
  $('.btn.resource-btn').click ->
    $('.modal.resource-modal').show()

  $('a.resource-close').click ->
    $('.modal.resource-modal').hide()

  $('.resources-sortable').sortable
    update: ->
      $.post $(this).attr( 'url' ), $(this).sortable 'serialize'
