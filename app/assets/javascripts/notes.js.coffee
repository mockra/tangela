jQuery ->
  $('.best_in_place').best_in_place()

  $('ul.notes.sortable').sortable
    axis: 'y'
    handle: '.handle'
    update: ->
      $.post( $(this).attr( 'url' ), $(this).sortable 'serialize' )
