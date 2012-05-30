$('span.notes').html(
  '<%= escape_javascript( render "projects/notes" ) %>'
  )

$('.best_in_place').best_in_place()

$('ul.notes.sortable').sortable
  axis: 'y'
  handle: '.handle'
  update: ->
    $.post( $(this).attr( 'url' ), $(this).sortable 'serialize' )
