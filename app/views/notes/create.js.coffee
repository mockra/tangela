$('ul.notes').prepend(
  $("<%= escape_javascript( render 'note', note: @note, project: @project ) %>")
)

$('.new_note')[0].reset()

$('.best_in_place').best_in_place()
