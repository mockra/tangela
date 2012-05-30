$('li.form').after(
  $("<%= escape_javascript( render 'note', note: @note, project: @project ) %>")
)

$('.new_note')[0].reset()

$('.best_in_place').best_in_place()

$('ul.notes.sortable').sortable
  axis: 'y'
  handle: '.handle'
  update: ->
    $.post( $(this).attr( 'url' ), $(this).sortable 'serialize' )
