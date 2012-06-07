$('table.notes tbody').prepend(
  $("<%= escape_javascript( render 'note', note: @note, project: @project ) %>")
)

$('.new_note')[0].reset()
