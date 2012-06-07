$('span.notes').html(
  '<%= escape_javascript( render "notes" ) %>'
  )

$('.best_in_place').best_in_place()

$('table.notes.sortable tbody').sortable
  axis: 'y'
  handle: '.handle'
  update: ->
    $.post( $('table.notes.sortable').attr( 'url' ), $(this).sortable 'serialize' )
